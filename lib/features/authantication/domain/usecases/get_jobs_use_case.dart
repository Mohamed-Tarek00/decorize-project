import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/data/repo_impl/jobs_repository_impl.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';
import 'package:decorize_project/features/authantication/domain/repositories/jobs_repository.dart';

class GetJobsUseCase {
  GetJobsUseCase(this.jobsRepository);
  final JobsRepository jobsRepository;
  Future<Either<Failure, List<Job>>> call() async {
    return await jobsRepository.getJobs();
  }
}
