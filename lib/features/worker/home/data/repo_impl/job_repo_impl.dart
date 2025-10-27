import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/worker/home/data/data_source/job_data_source.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/domain/repos/job_repo.dart';

class JobRepoImpl implements JobRepo {
  final JobDataSource jobDataSource;

  JobRepoImpl(this.jobDataSource);
  @override
  Future<Either<Failure, List<WorkerJobEntity>>> getJobs() async {
    return handleRequest(
      request: () async {
        final jobModels = await jobDataSource.getJobs();

        final jobs = jobModels.map((model) => model.toEntity()).toList();

        return jobs;
      },
    );
  }
}
