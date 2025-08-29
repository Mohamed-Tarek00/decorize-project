import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
}
