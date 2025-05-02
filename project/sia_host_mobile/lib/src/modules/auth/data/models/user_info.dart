import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  const UserInfo({
    required this.serverAddress,
    required this.email,
    required this.password,
    required this.key,
    required this.iv,
  });

  factory UserInfo.fromEncodedJson(String jsonString) {
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserInfo.fromJson(jsonMap);
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      serverAddress: json['serverAddress'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      key: json['key'] as String,
      iv: json['iv'] as String,
    );
  }
  final String serverAddress;
  final String email;
  final String password;
  final String key;
  final String iv;

  @override
  List<Object?> get props => [
        serverAddress,
        email,
        password,
        key,
        iv,
      ];

  UserInfo copyWith({
    String? serverAddress,
    String? email,
    String? password,
    String? key,
    String? iv,
  }) {
    return UserInfo(
      serverAddress: serverAddress ?? this.serverAddress,
      email: email ?? this.email,
      password: password ?? this.password,
      key: key ?? this.key,
      iv: iv ?? this.iv,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serverAddress': serverAddress,
      'email': email,
      'password': password,
      'key': key,
      'iv': iv,
    };
  }

  String toEncodedJson() => jsonEncode(this);
}
