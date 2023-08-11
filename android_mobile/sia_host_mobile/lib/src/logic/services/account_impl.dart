import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:renterd/renterd.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sia_host_mobile/src/logic/abstracts/account_abst.dart';
import 'package:sia_host_mobile/src/logic/models/account.dart';
import 'package:sia_host_mobile/src/utils/enums/errors_enum.dart';
import 'package:sia_host_mobile/src/utils/enums/success_enum.dart';
import 'package:sia_host_mobile/src/utils/helpers/encrytion_helpers/encrypter_helper.dart';
import 'package:sia_host_mobile/src/utils/helpers/host_helpers/host_helper.dart';
import 'package:sia_host_mobile/src/utils/messages/errors_message.dart';
import 'package:sia_host_mobile/src/utils/messages/success_message.dart';

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
      var _ipAdressConverted =
          await HostHelper.convertDnsToIp(dnsAddress: account.ipAddress);
      var _responseAccount = await Accounts.getAllAccounts(
          password: account.passWord, ipAdress: _ipAdressConverted);

      if (_responseAccount.statusCode == 200) {
        var _ipAdressEncrypt =
            EncrypterHelper.encrypt(data: _ipAdressConverted);
        var _passWordEncrypt = EncrypterHelper.encrypt(data: account.passWord);

        sharedPreferences.setString(
            "${dotenv.env['IP_ADRESS']}", _ipAdressEncrypt);
        sharedPreferences.setString(
            "${dotenv.env['PASSWRD']}", _passWordEncrypt);

        _result = Result.success(
            SuccessMessage.success(SuccessType.verificationSuccess));
      } else if (_responseAccount.statusCode == 401) {
        print(ErrorsMessage.error(Errors.verificationError));
        _result = Result.error(ErrorsMessage.error(Errors.verificationError));
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.error(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.error(Errors.errorUnknown));
    }

    return _result;
  }

  // Note : cette fonction permet de vérifier ssi , l'utilisateur s'est déjà connecté
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
