import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';

class EditPasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  EditPasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
  factory EditPasswordModel.fromEntity(EditPasswordEntity entity) {
    return EditPasswordModel(
      oldPassword: entity.oldPassword,
      newPassword: entity.newPassword,
      confirmPassword: entity.confirmPassword,
    );
  }
  toJson() {
    return {
      'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': confirmPassword,
    };
  }
}
