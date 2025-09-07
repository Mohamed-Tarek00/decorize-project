import 'package:decorize_project/features/authantication/data/models/city_model.dart';
import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';
import 'package:decorize_project/features/authantication/data/models/job_model.dart';
import 'package:decorize_project/features/authantication/data/models/register_request_model.dart';

abstract class RemoteDataSource {
  Future<List<GovernorateModel>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
  Future<List<JobModel>> getJobs();
  Future<void> sendRegisterRequest(RegisterRequestModel model);
}
