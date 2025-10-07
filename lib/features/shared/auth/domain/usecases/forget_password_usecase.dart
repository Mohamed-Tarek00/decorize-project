import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';

class ForgetPasswordUsecase {
  final AuthRepo staticRepo;

  ForgetPasswordUsecase({required this.staticRepo});
  Future<Either<Failure, ForgetPasswordResponseEntity>> call(
    ForgetPasswordEntity entity,
  ) async {
    return await staticRepo.forgetPassword(entity);
  }
}
