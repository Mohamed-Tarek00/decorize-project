import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';

abstract class StaticDataSource {
  Future<Map<String, dynamic>> getGovernorates();
  Future<Map<String, dynamic>> getCitiesByGovernorateId(int governorateId);
  Future<Map<String, dynamic>> getJobs();
}

class StaticDataSourceImpl implements StaticDataSource {
  final ApiService apiService;

  StaticDataSourceImpl({required this.apiService});

  @override
  Future<Map<String, dynamic>> getGovernorates() async {
    final data = await apiService.get(endPoint: 'auth/get-governorates');
    return data;
  }

  @override
  Future<Map<String, dynamic>> getCitiesByGovernorateId(
    int governorateId,
  ) async {
    final data = await apiService.get(
      endPoint: 'auth/get-cities/$governorateId',
    );
    return data;
  }

  @override
  Future<Map<String, dynamic>> getJobs() async {
    final data = await apiService.get(endPoint: 'auth/get-types');
    return data;
  }
}
