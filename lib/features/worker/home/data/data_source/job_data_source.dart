import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_model.dart';

abstract class JobDataSource {
  Future<List<WorkerJobModel>> getJobs();
}

class JobDataSourceImpl implements JobDataSource {
  final ApiService apiService;

  JobDataSourceImpl(this.apiService);

  @override
  Future<List<WorkerJobModel>> getJobs() async {
    final response = await apiService.get(endPoint: 'auth/worker/home');

    final List<dynamic> data = response['data'];
    final List<WorkerJobModel> jobs = data
        .map((json) => WorkerJobModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return jobs;
  }
}
