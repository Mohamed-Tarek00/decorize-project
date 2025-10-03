import 'package:decorize_project/features/shared/log/domain/entities/forget_password_response_entity.dart';
import 'user_model.dart';

class ForgetPasswordResponseModel extends ForgetPasswordResponseEntity {
  ForgetPasswordResponseModel({
    required super.verificationCode,
    required super.user,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ForgetPasswordResponseModel(
      verificationCode: data['verification_code'],
      user: UserModel.fromJson(data['user']),
    );
  }
}
