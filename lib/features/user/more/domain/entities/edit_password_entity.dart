class EditPasswordEntity {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  EditPasswordEntity({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
