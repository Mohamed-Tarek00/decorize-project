import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';

abstract class Repositoryinterface {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  );
  Future<Either<Failure, List<Job>>> getJobs();
  Future<Either<Failure, void>> sendRequest(RegisterRequest entity);
}
