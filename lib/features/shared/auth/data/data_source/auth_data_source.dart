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
  Future<Map<String, dynamic>> sendRegisterRequest(RegisterRequestModel model);
}
