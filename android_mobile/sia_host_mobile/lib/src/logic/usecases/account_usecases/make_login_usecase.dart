import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/abstracts/account_abst.dart';
import 'package:sia_host_mobile/src/logic/models/account.dart';

class MakeLoginUsecase {
  final AccountAbst accountAbst;

  MakeLoginUsecase({required this.accountAbst});

  Future<Result<String, String>> call({
    required Account account,
  }) async {
    return await accountAbst.makeLogin(account: account);
  }
}
