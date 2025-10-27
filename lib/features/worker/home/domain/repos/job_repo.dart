import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';

abstract class JobRepo {
  Future<Either<Failure, List<WorkerJobEntity>>> getJobs();
}
