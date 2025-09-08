import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/auth/domain/entities/city.dart';
import 'package:decorize_project/features/auth/domain/repositories/Repo_Interface.dart';

class GetCitiesUseCase {
  final Repositoryinterface repositoryinterface;

  GetCitiesUseCase(this.repositoryinterface);

  Future<Either<Failure, List<City>>> call(int governorateId) {
    return repositoryinterface.getCitiesByGovernorateId(governorateId);
  }
}
