import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../reposit_absts/fetch_user_credential_reposit_abst.dart';

@lazySingleton
class FetchUserCredentialUsecase {
  final FetchUserCredentialRepositAbst _fetchUserCredentialRepositAbst;

  FetchUserCredentialUsecase({
    required FetchUserCredentialRepositAbst fetchUserCredentialRepositAbst,
  }) : _fetchUserCredentialRepositAbst = fetchUserCredentialRepositAbst;

  Stream<Result<void, void>> call() =>
      _fetchUserCredentialRepositAbst.fetchUserCredential();
}
