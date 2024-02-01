import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart' as lang;
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/my_host_data_entity.dart';
import '../../domain/reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart';
import '../local_source/absts/fetch_the_user_credential_abst.dart';
import '../remote_source/absts/fetch_consensus_from_renter_abst.dart';
import '../remote_source/absts/fetch_hoster_from_renter_abst.dart';
import '../remote_source/models/my_host_data_model.dart';

@LazySingleton(as: FetchMyHostDataFromRenterRepositAbst)
class FetchMyHostDataFromRenterRepositImpl
    implements FetchMyHostDataFromRenterRepositAbst {
  final FetchTheUserCredentialAbst _fetchTheUserCredentialAbst;
  final FetchHosterFromRenterAbst _fetchHosterFromRenterAbst;
  final FetchConsensusFromRenterAbst _fetchConsensusFromRenterAbst;

  FetchMyHostDataFromRenterRepositImpl({
    required FetchTheUserCredentialAbst fetchTheUserCredentialAbst,
    required FetchHosterFromRenterAbst fetchHosterFromRenterAbst,
    required FetchConsensusFromRenterAbst fetchConsensusFromRenterAbst,
  })  : _fetchTheUserCredentialAbst = fetchTheUserCredentialAbst,
        _fetchHosterFromRenterAbst = fetchHosterFromRenterAbst,
        _fetchConsensusFromRenterAbst = fetchConsensusFromRenterAbst;

  @override
  Future<Result<MyHostDataEntity, String>> fetchTheHostDataFromRenter() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return _fetchTheUserCredentialAbst
          .fetchUserCredential()
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

  Future<Result<MyHostDataEntity, String>> fetchTheHoster({
    required String serverAddress,
    required String password,
  }) async {
    return _fetchHosterFromRenterAbst
        .fetchTheHoster(serverAddress: serverAddress, password: password)
        .then((_resultHoster) {
      if (_resultHoster.statusCode == HttpStatus.ok) {
        Map<String, dynamic> _hosterBody = json.decode(_resultHoster.body);

        return _fetchConsensusFromRenterAbst
            .fetchTheConsensus(serverAddress: serverAddress, password: password)
            .then((_resultConsensus) {
          if (_resultConsensus.statusCode == HttpStatus.ok) {
            Map<String, dynamic> _consensusBody =
                json.decode(_resultConsensus.body);

            if (_hosterBody.isEmpty || _consensusBody.isEmpty) {
              return const Result.error(lang.myHostNoFoundText);
            } else {
              var _hostDataModel = MyHostDataModel.fromHosterMap(_hosterBody);

              var _consensusDataModel = MyHostDataModel.fromConsensusMap({
                "blockHeight": _consensusBody["blockHeight"].toString(),
              });

              var _myHostDataEntity = MyHostDataEntity(
                blockHeight: _consensusDataModel.blockHeight,
                maxDownloadPrice: _hostDataModel.maxDownloadPrice,
                maxUploadPrice: _hostDataModel.maxUploadPrice,
                maxStoragePrice: _hostDataModel.maxStoragePrice,
                maxContractPrice: _hostDataModel.maxContractPrice,
                minAccountExpiry: _hostDataModel.minAccountExpiry,
                maxRPCPrice: _hostDataModel.maxRPCPrice,
              );

              return Result.success(_myHostDataEntity);
            }
          } else {
            return const Result.error(lang.internalServerErrorText);
          }
        });
      } else {
        return const Result.error(lang.internalServerErrorText);
      }
    });
  }
}
