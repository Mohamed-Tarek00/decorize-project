import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/data/data_source/type/get_jobs_remote_data_source.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';
import 'package:decorize_project/features/authantication/domain/repositories/jobs_repository.dart';

class JobsRepositoryImpl extends JobsRepository {
  JobsRepositoryImpl(this.jobsRemoteDataSource);
  JobsRemoteDataSource jobsRemoteDataSource;
  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final items = await jobsRemoteDataSource.getJobs();
      final jobs = items.map((job) => job.toEntity()).toList();
      return right(jobs);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
