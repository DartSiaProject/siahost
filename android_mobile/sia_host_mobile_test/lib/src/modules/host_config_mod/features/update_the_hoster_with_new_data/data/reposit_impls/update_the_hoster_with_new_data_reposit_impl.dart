import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/the_new_data_host_entity.dart';
import '../../domain/reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart';
import '../remote_source/absts/update_the_hoster_with_new_data_abst.dart';
import '../remote_source/models/the_new_data_host_model.dart';

@LazySingleton(as: UpdateTheHosterWithNewDataRepositAbst)
class UpdateTheHosterWithNewDataRepositImpl
    implements UpdateTheHosterWithNewDataRepositAbst {
  final UpdateTheHosterWithNewDataAbst _updateTheHosterWithNewDataAbst;

  UpdateTheHosterWithNewDataRepositImpl({
    required UpdateTheHosterWithNewDataAbst updateTheHosterWithNewDataAbst,
  }) : _updateTheHosterWithNewDataAbst = updateTheHosterWithNewDataAbst;

  @override
  Future<Result<String, String>> updateTheHosterWithNewData({
    required TheNewDataHostEntity theNewDataHostEntity,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      var _serverAddressDecrypted = EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userServerAdress"]);

      var _passwordDecrypted = EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userPassWord"]);

      var _theNewHostDataForUpdate = TheNewDataHostModel(
        maxDownloadPrice: theNewDataHostEntity.maxDownloadPrice,
        maxUploadPrice: theNewDataHostEntity.maxUploadPrice,
        maxStoragePrice: theNewDataHostEntity.maxStoragePrice,
        maxContractPrice: theNewDataHostEntity.maxContractPrice,
        minAccountExpiry: theNewDataHostEntity.minAccountExpiry,
        maxRPCPrice: theNewDataHostEntity.maxRPCPrice,
        hostBlockHeightLeeway: theNewDataHostEntity.hostBlockHeightLeeway,
        minMaxEphemeralAccountBalance:
            theNewDataHostEntity.minMaxEphemeralAccountBalance,
        minPriceTableValidity: theNewDataHostEntity.minPriceTableValidity,
      );

      return _updateTheHosterWithNewDataAbst
          .updateTheHosterWithNewData(
        theNewDataHostModel: _theNewHostDataForUpdate,
        serverAddress: _serverAddressDecrypted,
        password: _passwordDecrypted,
      )
          .then((_resultUpdate) {
        if (_resultUpdate.statusCode == HttpStatus.ok) {
          return const Result.success(Lang.configHostSuccessText);
        } else {
          return const Result.error(Lang.updateErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
