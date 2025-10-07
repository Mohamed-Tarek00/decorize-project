class LoginRequestEntity {
  final String email;
  final String password;
  final String? deviceToken;

  const LoginRequestEntity({
    required this.email,
    required this.password,
    this.deviceToken,
  });
}
