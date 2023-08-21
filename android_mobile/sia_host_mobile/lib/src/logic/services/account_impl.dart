import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:renterd/renterd.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/enums/errors_enum.dart';
import '../../utils/enums/success_enum.dart';
import '../../utils/helpers/encrytion_helpers/encrypter_helper.dart';
// import '../../utils/helpers/host_helpers/host_helper.dart';
import '../../utils/messages/errors_message.dart';
import '../../utils/messages/success_message.dart';
import '../abstracts/account_abst.dart';
import '../models/account.dart';

/// Project: [SiaHostsMobile],
/// enterprise: [CotradeChain]
/// description:  Dans ce fichier, nous avons les fonctions suivantes [login]
/// author: [James Brel]
/// createdAt: 11/08/2023
/// updatedAt: #
class AccountImpl implements AccountAbst {
  final SharedPreferences sharedPreferences;

  AccountImpl({required this.sharedPreferences});

  /// Note :  Cette fonction à l'utilisateur de connecté au serveur Sia
  @override
  Future<Result<String, String>> makeLogin({
    required Account account,
  }) async {
    Result<String, String> _result = const Result.error("");
    try {
      // var _ipAdressConverted =
      //     await HostHelper.convertDnsToIp(dnsAddress: account.ipAddress); // todo : ici je le commente pour le test mais après , il faudra chercher à savoir si c'est un dns valide ou pas

      var _responseAccount = await Accounts.getAllAccounts(
          password: account.passWord, ipAdress: account.ipAddress
          // _ipAdressConverted

          );

      if (_responseAccount.statusCode == 200) {
        var _ipAdressEncrypt = EncrypterHelper.encrypt(data: account.ipAddress
            // _ipAdressConverted
            );
        var _passWordEncrypt = EncrypterHelper.encrypt(data: account.passWord);

        sharedPreferences.setString(
            "${dotenv.env['IP_ADRESS']}", _ipAdressEncrypt);
        sharedPreferences.setString(
            "${dotenv.env['PASSWRD']}", _passWordEncrypt);

        _result = Result.success(
            SuccessMessage.success(SuccessType.verificationSuccess));
      } else if (_responseAccount.statusCode == 401) {
        print(ErrorsMessage.error(ErrorsType.verificationError));
        _result =
            Result.error(ErrorsMessage.error(ErrorsType.verificationError));
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.error(ErrorsType.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.error(ErrorsType.errorUnknown));
    }

    return _result;
  }

  /// Note : cette fonction permet de vérifier ssi , l'utilisateur s'est déjà connecté
  @override
  Future<bool> credentialsArePresent() async {
    bool _result = false;
    try {
      if (sharedPreferences.getString("${dotenv.env['IP_ADRESS']}") != null &&
          sharedPreferences.getString("${dotenv.env['PASSWRD']}") != null) {
        _result = true;
      }
    } catch (e) {
      print(e);
    }
    return _result;
  }
}
