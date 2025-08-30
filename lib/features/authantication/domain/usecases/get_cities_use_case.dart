import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/city.dart';
import 'package:decorize_project/features/authantication/domain/repositories/location_repository.dart';

class GetCitiesUseCase {
  final LocationRepository repository;

  GetCitiesUseCase(this.repository);

  Future<Either<Failure, List<City>>> call(int governorateId) {
    return repository.getCitiesByGovernorateId(governorateId);
  }
}
