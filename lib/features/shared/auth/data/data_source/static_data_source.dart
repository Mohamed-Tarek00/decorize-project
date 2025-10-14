import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/governorate_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';

abstract class StaticDataSource {
  Future<List<GovernorateModel>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
  Future<List<JobModel>> getJobs();
}

class StaticDataSourceImpl implements StaticDataSource {
  final ApiService apiService;

  StaticDataSourceImpl({required this.apiService});

  @override
  Future<List<GovernorateModel>> getGovernorates() async {
    final data = await apiService.get(endPoint: 'auth/get-governorates');
    final listOfGoverments = data['data'] as List;
        List<GovernorateModel> goveronrates = listOfGoverments
            .map((item) => GovernorateModel.fromJson(item))
            .toList();
    return goveronrates;
  }

  @override
  Future<List<CityModel>> getCitiesByGovernorateId(
    
    int governorateId,
  ) async {
    final data = await apiService.get(
      endPoint: 'auth/get-cities/$governorateId',
    );
    final listOfCities = data['data'] as List;
        List<CityModel> cities = listOfCities
            .map((item) => CityModel.fromJson(item))
            .toList();
    return cities;
  }

  @override
  Future<List<JobModel>> getJobs() async {
    final data = await apiService.get(endPoint: 'auth/get-types');
    final listOfJobs = data['data'] as List;
        List<JobModel> jobs = listOfJobs.map(
          (item) => JobModel.fromJson(item),
        ).toList();
    return jobs ;
  }
}
