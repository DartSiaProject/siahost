import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/global/map_variable.dart' as global;
import '../../domain/reposit_absts/fetch_user_credential_reposit_abst.dart';
import '../local_source/absts/fech_user_credential_abst.dart';

@LazySingleton(as: FetchUserCredentialRepositAbst)
class FetchUserCredentialRepositImpl implements FetchUserCredentialRepositAbst {
  final FetchUserCredentialAbst _fetchUserCredentialAbst;

  FetchUserCredentialRepositImpl({
    required FetchUserCredentialAbst fetchUserCredentialAbst,
  }) : _fetchUserCredentialAbst = fetchUserCredentialAbst;

  @override
  Stream<Result<void, void>> fetchUserCredential() {
    return _fetchUserCredentialAbst.fetchUserCredential().map((_result) {
      if (_result["data"] != "") {
        global.userInfo = json.decode(_result["data"]);
        return const Result.success("");
      } else {
        return const Result.error("");
      }
    });
  }
}
