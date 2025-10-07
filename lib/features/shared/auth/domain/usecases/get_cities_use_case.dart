import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class GetCitiesUseCase {
  final StaticRepo staticRepo;

  GetCitiesUseCase(this.staticRepo);

  Future<Either<Failure, List<City>>> call(int governorateId) {
    return staticRepo.getCitiesByGovernorateId(governorateId);
  }
}
