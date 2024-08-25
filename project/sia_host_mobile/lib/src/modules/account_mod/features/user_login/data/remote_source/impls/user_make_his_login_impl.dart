import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/user_make_his_login_abst.dart';
import '../models/user_login_model.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [makeTheLogin]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/08/2023
/// updatedAt: 23/08/2023

@LazySingleton(as: UserMakeHisLoginAbst)
class UserMakeHisLoginImpl implements UserMakeHisLoginAbst {
  /// Note: cette fonction permet à l'utilisateur de faire son login

  @override
  Future<Map<String, dynamic>> makeTheLogin({
    required UserLoginModel userLoginModel,
  }) async {
    return await Accounts.getAllAccounts(
      serverAddress: userLoginModel.toMap()["serverAddress"],
      password: userLoginModel.toMap()["passWord"],
    );
  }
}
