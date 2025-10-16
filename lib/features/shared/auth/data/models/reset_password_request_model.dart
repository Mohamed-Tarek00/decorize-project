import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_request_entity.dart';

class ResetPasswordRequestModel {
  final ResetPasswordRequestEntity entity;

  ResetPasswordRequestModel({required this.entity});

  Map<String, dynamic> toJson() {
    return {
      "password": entity.password,
      "password_confirmation": entity.passwordConfirmation,
    };
  }
}
