import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/features/fetch_user_credentials/data/local_source/absts/fetch_the_user_credential_abst.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/cryptography/requests/decrypt_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../../../../my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart';
import '../../domain/entities/the_host_data_entity.dart';
import '../../domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart';
import '../remote_source/models/the_host_data_model.dart';

@LazySingleton(as: FetchTheHostDataFromRenterForConfigRepositAbst)
class FetchTheHostDataFromRenterForConfigRepositImpl
    implements FetchTheHostDataFromRenterForConfigRepositAbst {
  final FetchTheUserCredentialAbst _fetchTheUserCredentialAbst;

  final FetchHosterFromRenterAbst _fetchHosterFromRenterAbst;

  FetchTheHostDataFromRenterForConfigRepositImpl({
    required FetchTheUserCredentialAbst fetchTheUserCredentialAbst,
    required FetchHosterFromRenterAbst fetchHosterFromRenterAbst,
  })  : _fetchTheUserCredentialAbst = fetchTheUserCredentialAbst,
        _fetchHosterFromRenterAbst = fetchHosterFromRenterAbst;

  @override
  Future<Result<TheHostDataEntity, String>>
      fetchTheHostDataFromRenterForConfig() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return _fetchTheUserCredentialAbst
          .fetchUserCredential()
          .then((_resultCredential) async {
        if (_resultCredential["status"] == false) {
          return const Result.error(Lang.makeLoginDemandText);
        } else {
          // global.userInfo = json.decode(_resultCredential["data"]);

          // var _serverAddressDecrypted = EncrypterRequest.decrypt(
          //     dataEncrypted: global.userInfo["userServerAdress"]);

          // var _passwordDecrypted = EncrypterRequest.decrypt(
          //     dataEncrypted: global.userInfo["userPassWord"]);

          return await fetchTheHoster(
            serverAddress: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userServerAdress"]),
            // password: _passwordDecrypte,
            key: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userKey"]),
            iv: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userIv"]),
          );
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }

  Future<Result<TheHostDataEntity, String>> fetchTheHoster({
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  }) async {
    return _fetchHosterFromRenterAbst
        .fetchTheHoster(
      serverAddress: serverAddress,
      // password: password,
      key: key,
      iv: iv,
    )
        .then((_resultHoster) {
      if (_resultHoster["status"] &&
          (_resultHoster["response"] as Response<String>).statusCode ==
              HttpStatus.ok) {
        Map<String, dynamic> _hosterBody =
            json.decode(DecryptRequest.decryptStringWithAES256CBC(
          chipherText: json.decode(
              (_resultHoster["response"] as Response<String>).data!)["data"],
          key: EncrypterRequest.decrypt(
              dataEncrypted: global.userInfo["userKey"]),
          iv: EncrypterRequest.decrypt(
              dataEncrypted: global.userInfo["userIv"]),
        ));

        if (_hosterBody.isEmpty) {
          return const Result.error(Lang.myHostNoFoundText);
        } else {
          var _hostDataModel = TheHostDataModel.fromMap(_hosterBody);

          var _theHostDataEntity = TheHostDataEntity(
            maxDownloadPrice: _hostDataModel.maxDownloadPrice,
            maxUploadPrice: _hostDataModel.maxUploadPrice,
            maxStoragePrice: _hostDataModel.maxStoragePrice,
            maxContractPrice: _hostDataModel.maxContractPrice,
            minAccountExpiry: _hostDataModel.minAccountExpiry,
            maxRPCPrice: _hostDataModel.maxRPCPrice,
            hostBlockHeightLeeway: _hostDataModel.hostBlockHeightLeeway,
            minMaxEphemeralAccountBalance:
                _hostDataModel.minMaxEphemeralAccountBalance,
            minPriceTableValidity: _hostDataModel.minPriceTableValidity,
          );

          return Result.success(_theHostDataEntity);
        }
      } else if (_resultHoster["status"] == false &&
              (_resultHoster["error"] as DioException).type ==
                  DioExceptionType.connectionTimeout ||
          (_resultHoster["error"] as DioException).type ==
              DioExceptionType.receiveTimeout) {
        return const Result.error(Lang.timeErrorText);
      } else {
        return const Result.error(Lang.internalServerErrorText);
      }
    });
  }
}
