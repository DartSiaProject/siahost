import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/account_abst.dart';
import '../../models/account.dart';

class MakeLoginUsecase {
  final AccountAbst accountAbst;

  MakeLoginUsecase({required this.accountAbst});

  Future<Result<String, String>> call({
    required Account account,
  }) async {
    return await accountAbst.makeLogin(account: account);
  }
}
