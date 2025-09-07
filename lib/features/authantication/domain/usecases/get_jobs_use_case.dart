import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';
import 'package:decorize_project/features/authantication/domain/repositories/Repo_Interface.dart';
import 'package:decorize_project/features/authantication/domain/repositories/jobs_repository.dart';

class GetJobsUseCase {
  GetJobsUseCase(this.repositoryinterface);
  final Repositoryinterface repositoryinterface;
  Future<Either<Failure, List<Job>>> call() async {
    return await repositoryinterface.getJobs();
  }
}
