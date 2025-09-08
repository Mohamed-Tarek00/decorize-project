import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/remote_data_source.dart';
import 'package:decorize_project/features/authantication/data/models/city_model.dart';
import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';
import 'package:decorize_project/features/authantication/data/models/job_model.dart'
    show JobModel;
import 'package:decorize_project/features/authantication/data/models/register_request_model.dart';

class LocationRemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  LocationRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<GovernorateModel>> getGovernorates() async {
    final data = await apiService.get(endPoint: 'auth/get-governorates');
    final listofGovernorates = data['data'] as List;
    return listofGovernorates
        .map((item) => GovernorateModel.fromJson(item))
        .toList();
  }

  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId) async {
    final data = await apiService.get(
      endPoint: 'auth/get-cities/$governorateId',
    );
    final listofCities = data['data'] as List;
    return listofCities.map((item) => CityModel.fromJson(item)).toList();
  }

  Future<List<JobModel>> getJobs() async {
    final data = await apiService.get(endPoint: 'auth/get-types');
    final listOfJobs = data['data'] as List;
    return listOfJobs.map((item) => JobModel.fromJson(item)).toList();
  }

  Future<Map<String, dynamic>> sendRegisterRequest(
    RegisterRequestModel model,
  ) async {
    final data = model.toJson();
    return await apiService.post(endPoint: 'auth/register', data: data);
  }
}
