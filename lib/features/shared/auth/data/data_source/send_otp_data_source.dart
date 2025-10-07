import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';

abstract class SendOtpDataSource {
  Future<Map<String, dynamic>> sendOtpKey(VerificationModel model);
}
