import 'package:decorize_project/features/shared/log/data/models/auth_response_model.dart';
import 'package:decorize_project/features/shared/log/data/models/forget_password_model.dart';
import 'package:decorize_project/features/shared/log/data/models/forget_password_response_model.dart';
import 'package:decorize_project/features/shared/log/data/models/login_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<AuthResponseModel> loginRequest({required LoginRequestModel model});

  Future<ForgetPasswordResponseModel> forgetPasswordRequest({
    required ForgetPasswordModel model,
  });
}
