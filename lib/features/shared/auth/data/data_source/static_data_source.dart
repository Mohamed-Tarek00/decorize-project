import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';

abstract class StaticDataSource {
  Future<Map<String, dynamic>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
  Future<List<JobModel>> getJobs();
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
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId) async {
    final data = await apiService.get(
      endPoint: 'auth/get-cities/$governorateId',
    );
    final listofCities = data['data'] as List;
    return listofCities.map((item) => CityModel.fromJson(item)).toList();
  }

  @override
  Future<List<JobModel>> getJobs() async {
    final data = await apiService.get(endPoint: 'auth/get-types');
    final listOfJobs = data['data'] as List;
    return listOfJobs.map((item) => JobModel.fromJson(item)).toList();
  }
}
