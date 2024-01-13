import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart' as lang;
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../../../../my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart';
import '../../domain/entities/the_host_data_entity.dart';
import '../../domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart';
import '../local_source/absts/fetch_the_user_credential_for_config_abst.dart';
import '../remote_source/models/the_host_data_model.dart';

@LazySingleton(as: FetchTheHostDataFromRenterForConfigRepositAbst)
class FetchTheHostDataFromRenterForConfigRepositImpl
    implements FetchTheHostDataFromRenterForConfigRepositAbst {
  final FetchTheUserCredentialForConfigAbst
      _fetchTheUserCredentialForConfigAbst;
  final FetchHosterFromRenterAbst _fetchHosterFromRenterAbst;

  FetchTheHostDataFromRenterForConfigRepositImpl({
    required FetchTheUserCredentialForConfigAbst
        fetchTheUserCredentialForConfigAbst,
    required FetchHosterFromRenterAbst fetchHosterFromRenterAbst,
  })  : _fetchTheUserCredentialForConfigAbst =
            fetchTheUserCredentialForConfigAbst,
        _fetchHosterFromRenterAbst = fetchHosterFromRenterAbst;

  @override
  Future<Result<TheHostDataEntity, String>>
      fetchTheHostDataFromRenterForConfig() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return _fetchTheUserCredentialForConfigAbst
          .fetchUserCredentialForConfig()
          .then((_resultCredential) async {
        if (_resultCredential["status"] == false) {
          return const Result.error(lang.makeLoginDemandText);
        } else {
          global.userInfo = json.decode(_resultCredential["data"]);

          var _serverAddressDecrypted = EncrypterRequest.decrypt(
              dataEncrypted: global.userInfo["userServerAdress"]);

          var _passwordDecrypted = EncrypterRequest.decrypt(
              dataEncrypted: global.userInfo["userPassWord"]);

          return await fetchTheHoster(
              serverAddress: _serverAddressDecrypted,
              password: _passwordDecrypted);
        }
      });
    } else {
      return const Result.error(lang.noConnectionText);
    }
  }

  Future<Result<TheHostDataEntity, String>> fetchTheHoster({
    required String serverAddress,
    required String password,
  }) async {
    return _fetchHosterFromRenterAbst
        .fetchTheHoster(serverAddress: serverAddress, password: password)
        .then((_resultHoster) {
      if (_resultHoster.statusCode == HttpStatus.ok) {
        Map<String, dynamic> _hosterBody = json.decode(_resultHoster.body);

        if (_hosterBody.isEmpty) {
          return const Result.error(lang.myHostNoFoundText);
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
      } else {
        return const Result.error(lang.internalServerErrorText);
      }
    });
  }
}
