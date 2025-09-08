import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/auth/domain/repositories/Repo_Interface.dart';

class RegisterUseCase {
  final Repositoryinterface repositoryinterface;
  RegisterUseCase(this.repositoryinterface);
  Future<Either<Failure, void>> call(RegisterRequest entity) async {
    return await repositoryinterface.sendRequest(entity);
  }
}
