import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/repositories/Repo_Interface.dart';

class GetGovernoratesUseCase {
  final Repositoryinterface repositoryinterface;

  GetGovernoratesUseCase(this.repositoryinterface);

  Future<Either<Failure, List<Governorate>>> call() async {
    return await repositoryinterface.getGovernorates();
  }
}
