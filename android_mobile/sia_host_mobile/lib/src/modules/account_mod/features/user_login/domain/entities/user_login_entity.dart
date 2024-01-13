import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String serverAddress;
  final String passWord;

  const UserLoginEntity({
    this.serverAddress = "",
    this.passWord = "",
  });

  @override
  List<Object> get props => [
        serverAddress,
        passWord,
      ];
}
