import '../../../domain/entities/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  const UserLoginModel({
    super.serverAddress,
    super.passWord,
  });

  Map<String, dynamic> toMap() {
    return {
      'serverAddress': serverAddress,
      'passWord': passWord,
    };
  }
}
