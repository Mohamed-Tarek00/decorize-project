import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/log/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/login_request_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequestEntity entity);
  Future<Either<Failure, ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordEntity entity,
  );
}
