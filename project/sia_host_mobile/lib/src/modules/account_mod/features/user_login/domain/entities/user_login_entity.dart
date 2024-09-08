import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String serverAddress;
  final String mailAdress;
  final String passWord;

  const UserLoginEntity({
    this.serverAddress = "",
    this.mailAdress = "",
    this.passWord = "",
  });

  @override
  List<Object> get props => [
        serverAddress,
        mailAdress,
        passWord,
      ];
}
