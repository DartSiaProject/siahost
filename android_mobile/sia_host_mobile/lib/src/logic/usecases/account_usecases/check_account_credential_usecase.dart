import '../../abstracts/account_abst.dart';

class CheckAccountCredentialUsecase {
  final AccountAbst accountAbst;

  CheckAccountCredentialUsecase({required this.accountAbst});

  Future<bool> call() async {
    return await accountAbst.credentialsArePresent();
  }
}
