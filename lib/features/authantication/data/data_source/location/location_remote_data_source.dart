import 'package:decorize_project/features/authantication/data/models/city_model.dart';
import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<GovernorateModel>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
}
