import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/repos/login_repo.dart';

class ForgetPasswordUsecase {
  final LoginRepository repository;

  ForgetPasswordUsecase({required this.repository});
  Future<Either<Failure, ForgetPasswordResponseEntity>> call(
    ForgetPasswordEntity entity,
  ) async {
    return await repository.forgetPassword(entity);
  }
}
