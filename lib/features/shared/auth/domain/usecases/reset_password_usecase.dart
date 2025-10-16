import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';

class ResetPasswordUsecase {
  final AuthRepo authRepo;

  ResetPasswordUsecase({required this.authRepo});
  Future<Either<Failure, ResetPasswordResponseEntity>> call(
    ResetPasswordRequestEntity entity,
  ) async {
    return await authRepo.resetPassword(entity);
  }
}
