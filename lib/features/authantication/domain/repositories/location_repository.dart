import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/city.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  );
}
