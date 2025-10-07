import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';

class SendOtpDataSourceImpl implements SendOtpDataSource {
  final ApiService apiService;

  SendOtpDataSourceImpl({required this.apiService});

  @override
  Future<Map<String, dynamic>> sendOtpKey(VerificationModel model) async {
    final data = model.toJson();
    final response = await apiService.post(
      endPoint: 'auth/verify-otp',
      data: data,
    );
    return response;
  }
}
