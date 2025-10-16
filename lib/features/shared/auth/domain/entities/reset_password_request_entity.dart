class ResetPasswordRequestEntity {
  final String password;
  final String passwordConfirmation;

  ResetPasswordRequestEntity({
    required this.password,
    required this.passwordConfirmation,
  });
}
