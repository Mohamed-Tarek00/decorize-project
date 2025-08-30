import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/location_remote_data_source.dart';
import 'package:decorize_project/features/authantication/data/models/city_model.dart';
import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
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
}
