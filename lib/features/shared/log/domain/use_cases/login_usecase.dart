import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/log/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/log/domain/repos/login_repo.dart';

class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase({required this.repository});
  Future<Either<Failure, AuthResponseEntity>> call(
    LoginRequestEntity entity,
  ) async {
    return await repository.login(entity);
  }
}
