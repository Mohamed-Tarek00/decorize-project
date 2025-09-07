import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/city.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';

abstract class Repositoryinterface {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  );
  Future<Either<Failure, List<Job>>> getJobs();
}
