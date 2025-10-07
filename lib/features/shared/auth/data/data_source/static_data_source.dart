import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/governorate_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';

abstract class StaticDataSource {
  Future<List<GovernorateModel>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
  Future<List<JobModel>> getJobs();
}
