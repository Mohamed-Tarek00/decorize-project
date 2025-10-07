import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, void>> call(RegisterRequest entity) async {
    return await authRepo.register(entity);
  }
}
