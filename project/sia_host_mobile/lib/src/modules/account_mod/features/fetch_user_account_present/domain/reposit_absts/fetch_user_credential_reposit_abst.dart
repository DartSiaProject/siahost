import 'package:multiple_result/multiple_result.dart';

abstract class FetchUserCredentialRepositAbst {
  Stream<Result<void, void>> fetchUserCredential();
}
