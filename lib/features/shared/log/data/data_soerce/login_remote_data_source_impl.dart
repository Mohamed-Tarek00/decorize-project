import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/log/data/data_soerce/login_remote_data_source.dart';
import 'package:decorize_project/features/shared/log/data/models/auth_response_model.dart';
import 'package:decorize_project/features/shared/log/data/models/forget_password_model.dart';
import 'package:decorize_project/features/shared/log/data/models/forget_password_response_model.dart';
import 'package:decorize_project/features/shared/log/data/models/login_request_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl({required this.apiService});
  @override
  Future<AuthResponseModel> loginRequest({
    required LoginRequestModel model,
  }) async {
    final data = model.toJson();
    final response = await apiService.post(endPoint: 'auth/login', data: data);
    return AuthResponseModel.fromJson(response);
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPasswordRequest({
    required ForgetPasswordModel model,
  }) async {
    final data = model.toJson();
    final response = await apiService.post(
      endPoint: 'auth/forget-password',
      data: data,
    );
    return ForgetPasswordResponseModel.fromJson(response);
  }
}
