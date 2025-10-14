import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponseEntity>> register(RegisterRequest entity);
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequestEntity entity);
  Future<Either<Failure, ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordEntity entity,
  );
}
