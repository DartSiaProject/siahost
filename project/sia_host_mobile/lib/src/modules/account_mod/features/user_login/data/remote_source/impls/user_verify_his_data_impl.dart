import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/http/requests/http_post_request.dart';
import '../absts/user_verify_his_data_abst.dart';
import '../models/user_login_model.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [makeVerification]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 23/08/2024
/// updatedAt: 24/08/2024

@LazySingleton(as: UserVerifyHisDataAbst)
class UserVerifyHisDataImpl implements UserVerifyHisDataAbst {
  /// Note :  cette méthode permet à l'utilisateur de vérifier ses identifiants avant de procéder à la connexion

  @override
  Future<Map<String, dynamic>> makeVerification({
    required UserLoginModel userLoginModel,
  }) async {
    return HttpPostRequest.post<String>(
      api: userLoginModel.toMap()["serverAddress"],
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      content: json.encode({
        "email": userLoginModel.toMap()["mail"],
        "password": userLoginModel.toMap()["passWord"],
      }),
    );

    // .post(
    //   apiUri: userLoginModel.toMap()["serverAddress"],
    //   contentBody: {
    //     "email": userLoginModel.toMap()["mail"],
    //     "password": userLoginModel.toMap()["passWord"],
    //   },
    // );
  }
}
