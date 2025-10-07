import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo authRepo;
  LoginUsecase({required this.authRepo});
  Future<Either<Failure, AuthResponseEntity>> call(
    LoginRequestEntity entity,
  ) async {
    return await authRepo.login(entity);
  }
}
