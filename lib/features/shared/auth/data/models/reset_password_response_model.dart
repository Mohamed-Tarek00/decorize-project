import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_response_entity.dart';

class ResetPasswordResponseModel {
  final String accessToken;

  ResetPasswordResponseModel({required this.accessToken});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      accessToken: json['access_token'] as String,
    );
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(accessToken: accessToken);
  }
}
