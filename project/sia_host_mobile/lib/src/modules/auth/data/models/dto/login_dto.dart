import 'package:equatable/equatable.dart';

class LoginDto extends Equatable {
  const LoginDto({
    required this.serverAddress,
    required this.email,
    required this.password,
  });

  final String serverAddress;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'serverAddress': serverAddress,
      'email': email,
      'password': password,
    };
  }

  LoginDto copyWith({
    String? serverAddress,
    String? email,
    String? password,
  }) {
    return LoginDto(
      serverAddress: serverAddress ?? this.serverAddress,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        serverAddress,
        email,
        password,
      ];
}
