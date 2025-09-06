import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<Job>>> getJobs();
}
