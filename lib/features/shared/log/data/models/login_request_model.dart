import '../../domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  const LoginRequestModel({
    required super.email,
    required super.password,
    super.deviceToken,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'deviceToken': deviceToken};
  }
}
