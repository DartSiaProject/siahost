import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/update_the_hoster_with_new_data_abst.dart';
import '../models/the_new_data_host_model.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [updateTheHosterWithNewData]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: UpdateTheHosterWithNewDataAbst)
class UpdateTheHosterWithNewDataImpl implements UpdateTheHosterWithNewDataAbst {
  /// Note :  cette fonction permet de mettre à jour le hoster qui a été déjà récupérer

  @override
  Future<Map<String, dynamic>> updateTheHosterWithNewData({
    required TheNewDataHostModel theNewDataHostModel,
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  }) async {
    return await Hoster.updateSomeHost(
      hostConfig: theNewDataHostModel.toMap(),
      serverAddress: serverAddress,
      // password: password,
      key: key,
      iv: iv,
    );
  }
}
