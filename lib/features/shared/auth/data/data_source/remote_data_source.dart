import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/governorate_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/register_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';

abstract class RemoteDataSource {
  Future<List<GovernorateModel>> getGovernorates();
  Future<List<CityModel>> getCitiesByGovernorateId(int governorateId);
  Future<List<JobModel>> getJobs();
  Future<Map<String, dynamic>> sendRegisterRequest(RegisterRequestModel model);
  Future<Map<String, dynamic>> sendOtpKey(VerificationModel model);
}
