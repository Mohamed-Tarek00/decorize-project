import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';

abstract class StaticRepo {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  );
  Future<Either<Failure, List<Job>>> getJobs();
}
