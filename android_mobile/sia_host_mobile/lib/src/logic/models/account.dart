import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String ipAddress;
  final String passWord;

  const Account({
    this.ipAddress = "",
    this.passWord = "",
  });

  Account copyWith({
    String? ipAddress,
    String? passWord,
  }) {
    return Account(
      ipAddress: ipAddress ?? this.ipAddress,
      passWord: passWord ?? this.passWord,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ipAddress': ipAddress,
      'passWord': passWord,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      ipAddress: map['ipAddress'] ?? '',
      passWord: map['passWord'] ?? '',
    );
  }

  @override
  List<Object> get props => [
        ipAddress,
        passWord,
      ];
}
