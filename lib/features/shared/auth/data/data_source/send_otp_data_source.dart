import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/auth_response_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';

abstract class SendOtpDataSource {
  Future<AuthResponseModel> sendOtpKey(VerificationModel model);
}

class SendOtpDataSourceImpl implements SendOtpDataSource {
  final ApiService apiService;

  SendOtpDataSourceImpl({required this.apiService});

  @override
  Future<AuthResponseModel> sendOtpKey(VerificationModel model) async {
    final data = model.toJson();
    final response = await apiService.post(
      endPoint: 'auth/verify-otp',
      data: data,
    );
    return AuthResponseModel.fromJson(response);
  }
}
