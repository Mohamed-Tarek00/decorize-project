import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/auth/domain/entities/job.dart';
import 'package:decorize_project/features/auth/domain/repositories/Repo_Interface.dart';

class GetJobsUseCase {
  GetJobsUseCase(this.repositoryinterface);
  final Repositoryinterface repositoryinterface;
  Future<Either<Failure, List<Job>>> call() async {
    return await repositoryinterface.getJobs();
  }
}
