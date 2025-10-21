import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/location/domain/entities/location_entity.dart';
import 'package:decorize_project/core/location/domain/repos/location_repo.dart';

class LocationUseCase {
  LocationRepo locationRepo;
  LocationUseCase(this.locationRepo);
  Future<Either<Failure,LocationEntity>> call({
    required double latitude,
    required double longitude,
    String language = 'ar',
  }) async {
    return await locationRepo.getLocation(
      latitude: latitude,
      longitude: longitude,
      language: language,
    );
  }
}
