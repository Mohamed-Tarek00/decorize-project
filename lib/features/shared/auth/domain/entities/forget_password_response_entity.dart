import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';

class ForgetPasswordResponseEntity {
  final String verificationCode;
  final UserEntity user;

  ForgetPasswordResponseEntity({
    required this.verificationCode,
    required this.user,
  });
}
