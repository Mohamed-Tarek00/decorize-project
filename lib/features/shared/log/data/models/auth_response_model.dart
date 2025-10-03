import 'package:decorize_project/features/shared/log/data/models/user_model.dart';
import 'package:decorize_project/features/shared/log/domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({
    required super.accessToken,
    super.verificationCode,
    required super.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AuthResponseModel(
      accessToken: data['access_token'],
      verificationCode: data['verification_code'],
      user: UserModel.fromJson(data['user']),
    );
  }
}
