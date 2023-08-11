import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/models/account.dart';

abstract class AccountAbst {
  Future<Result<String, String>> makeLogin({
    required Account account,
  });

  Future<bool> credentialsArePresent();
}
