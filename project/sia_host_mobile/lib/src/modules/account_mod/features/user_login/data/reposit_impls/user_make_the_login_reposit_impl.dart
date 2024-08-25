import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/extensions/string_ext.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/cryptography/requests/generator_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/user_login_entity.dart';
import '../../domain/reposit_absts/user_make_the_login_reposit_abst.dart';
import '../local_source/absts/cache_the_user_credential_after_login_abst.dart';
import '../local_source/absts/secure_the_user_credential_abst.dart';
import '../remote_source/absts/user_make_his_login_abst.dart';
import '../remote_source/absts/user_verify_his_data_abst.dart';
import '../remote_source/models/user_login_model.dart';

@LazySingleton(as: UserMakeTheLoginRepositAbst)
class UserMakeTheLoginRepositImpl implements UserMakeTheLoginRepositAbst {
  final UserVerifyHisDataAbst _userVerifyHisDataAbst;

  final UserMakeHisLoginAbst _userMakeHisLoginAbst;
  final SecureTheUserCredentialAbst _secureTheUserCredentialAbst;
  final CacheTheUserCredentialAfterLoginAbst
      _cacheTheUserCredentialAfterLoginAbst;

  UserMakeTheLoginRepositImpl({
    required UserVerifyHisDataAbst userVerifyHisDataAbst,
    required UserMakeHisLoginAbst userMakeHisLoginAbst,
    required SecureTheUserCredentialAbst secureTheUserCredentialAbst,
    required CacheTheUserCredentialAfterLoginAbst
        cacheTheUserCredentialAfterLoginAbst,
  })  : _userVerifyHisDataAbst = userVerifyHisDataAbst,
        _userMakeHisLoginAbst = userMakeHisLoginAbst,
        _secureTheUserCredentialAbst = secureTheUserCredentialAbst,
        _cacheTheUserCredentialAfterLoginAbst =
            cacheTheUserCredentialAfterLoginAbst;

  @override
  Future<Result<String, String>> userMakeHisLogin({
    required UserLoginEntity userLoginEntity,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      if (!userLoginEntity.serverAddress.hasValidAddress()) {
        return const Result.error(Lang.sendGoodAddressErrorText);
      } else {
        var _userLoginModel = UserLoginModel(
          serverAddress: userLoginEntity.serverAddress,
          mailAdress: userLoginEntity.mailAdress,
          passWord: userLoginEntity.passWord,
        );

        var _checkVerification = await _userVerifyHisDataAbst.makeVerification(
          userLoginModel: _userLoginModel,
        );

        if (_checkVerification["status"] &&
            (_checkVerification["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          var _personalkey = GeneratorRequest.generateKeyAndIv(
            "${userLoginEntity.mailAdress}${userLoginEntity.passWord}",
          );
          var _serverAdressEncrypt =
              EncrypterRequest.encrypt(data: _userLoginModel.serverAddress);
          var _mailAdressEncrypt =
              EncrypterRequest.encrypt(data: _userLoginModel.mailAdress);
          var _passWordEncrypt =
              EncrypterRequest.encrypt(data: _userLoginModel.passWord);
          var _keyEncrypt =
              EncrypterRequest.encrypt(data: _personalkey["key"]!);

          global.userInfo = {
            "userServerAdress": _serverAdressEncrypt,
            "userMailAdress": _mailAdressEncrypt,
            "userPassWord": _passWordEncrypt,
            "userKey": _keyEncrypt,
          };
          var _userInfoJsoned = json.encode(global.userInfo);
          await _secureTheUserCredentialAbst.secureUserCredentials(
              userCredentialsJsoned: _userInfoJsoned);

          await _cacheTheUserCredentialAfterLoginAbst
              .cacheUserCredentialAfterLogin(userPresence: _userInfoJsoned);

          return const Result.success(Lang.credentialSuccessText);
        } else if (_checkVerification["status"] == false &&
                (_checkVerification["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_checkVerification["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          return const Result.error(Lang.timeErrorText);
        } else {
          return const Result.error(Lang.internalServerErrorText);
        }

        // return await _userMakeHisLoginAbst
        //     .makeTheLogin(userLoginModel: _userLoginModel)
        //     .then((_result) async {
        //   if (_result.statusCode == HttpStatus.ok) {
        //     var _serverAdressEncrypt =
        //         EncrypterRequest.encrypt(data: _userLoginModel.serverAddress);
        //     var _passWordEncrypt =
        //         EncrypterRequest.encrypt(data: _userLoginModel.passWord);
        //     global.userInfo = {
        //       "userServerAdress": _serverAdressEncrypt,
        //       "userPassWord": _passWordEncrypt
        //     };
        //     var _userInfoJsoned = json.encode(global.userInfo);
        //     await _secureTheUserCredentialAbst.secureUserCredentials(
        //         userCredentialsJsoned: _userInfoJsoned);

        //     await _cacheTheUserCredentialAfterLoginAbst
        //         .cacheUserCredentialAfterLogin(userPresence: _userInfoJsoned);

        //     return const Result.success(Lang.credentialSuccessText);
        //   } else if (_result.statusCode == HttpStatus.unauthorized) {
        //     return const Result.error(Lang.credentialErrorText);
        //   } else {
        //     return const Result.error(Lang.internalServerErrorText);
        //   }
        // });
      }
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
