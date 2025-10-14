import '../../domain/entities/login_request_entity.dart';

class LoginRequestModel {
  final LoginRequestEntity entity;
  const LoginRequestModel({required this.entity});

  Map<String, dynamic> toJson() {
    return {
      'email': entity.email,
      'password': entity.password,
      'deviceToken': entity.deviceToken,
    };
  }
}
