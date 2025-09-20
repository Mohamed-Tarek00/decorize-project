import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';

class VerificationModel {
  final String email;
  final String otpKey;
  VerificationModel({required this.email, required this.otpKey});
  Map<String, dynamic> toJson() {
    return {'code': otpKey, 'email': email};
  }

  factory VerificationModel.fromEntity(Verification entity) {
    return VerificationModel(email: entity.email, otpKey: entity.otpKey);
  }
}
