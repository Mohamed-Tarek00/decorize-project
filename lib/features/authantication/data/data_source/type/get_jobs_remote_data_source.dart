import 'package:decorize_project/features/authantication/data/models/job_model.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> getJobs();
}
