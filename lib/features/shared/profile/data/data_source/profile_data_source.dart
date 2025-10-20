import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/user_model.dart';
import 'package:decorize_project/features/shared/profile/data/models/worker_details_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getProfile();
  Future<WorkerDetailsModel> getWorkerDetails({required int workerId});
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final ApiService apiService;

  ProfileDataSourceImpl(this.apiService);

  @override
  Future<UserModel> getProfile() async {
    final response = await apiService.get(endPoint: 'auth/profile');
    final data = response['data']['user'] as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  @override
  Future<WorkerDetailsModel> getWorkerDetails({required int workerId}) async {
    final response = await apiService.get(
      endPoint: 'auth/worker-profile?worker_id=$workerId',
    );
    final data = response['data'] as Map<String, dynamic>;
    return WorkerDetailsModel.fromJson(data);
  }
}
