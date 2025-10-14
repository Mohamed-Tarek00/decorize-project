import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/auth_response_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/forget_password_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/forget_password_response_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/login_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/register_request_model.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> loginRequest({required LoginRequestModel model});

  Future<ForgetPasswordResponseModel> forgetPasswordRequest({
    required ForgetPasswordModel model,
  });
  Future<AuthResponseModel> sendRegisterRequest(RegisterRequestModel model);
}
class AuthDataSourceImpl implements AuthDataSource {
  final ApiService apiService;

  AuthDataSourceImpl({required this.apiService});

  @override
  Future<AuthResponseModel> sendRegisterRequest(
    RegisterRequestModel model,
  ) async {
    final data = model.toJson();
   final response = await apiService.post(endPoint: 'auth/register', data: data);
   return AuthResponseModel.fromJson(response);
  }

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
