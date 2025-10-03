import 'package:decorize_project/features/shared/log/domain/entities/user_entity.dart';

class AuthResponseEntity {
  final String? accessToken;
  final String? verificationCode;
  final UserEntity user;

  AuthResponseEntity({
    required this.accessToken,
    this.verificationCode,
    required this.user,
  });
}
