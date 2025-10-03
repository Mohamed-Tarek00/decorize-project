import 'package:decorize_project/features/shared/log/domain/entities/user_entity.dart';

class ForgetPasswordResponseEntity {
  final String verificationCode;
  final UserEntity user;

  ForgetPasswordResponseEntity({
    required this.verificationCode,
    required this.user,
  });
}
