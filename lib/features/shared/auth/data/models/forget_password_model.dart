import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity {
  ForgetPasswordModel({required super.email});
  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
