import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/type/get_jobs_remote_data_source.dart';
import 'package:decorize_project/features/authantication/data/models/job_model.dart';

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  ApiService apiService;
  JobsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<JobModel>> getJobs() async {
    final data = await apiService.get(endPoint: '/auth/get-types');
    final listOfJobs = data['data'] as List;
    return listOfJobs.map((item) => JobModel.fromJson(item)).toList();
  }
}
