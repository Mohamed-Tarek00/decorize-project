import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/otp_repo.dart';

class OtpVerificationUseCase {
  final OtpRepo otpRepo;
  OtpVerificationUseCase(this.otpRepo);
  Future<Either<Failure, AuthResponseEntity>> call(
    Verification entity,
  ) async {
    return await otpRepo.sendOtp(entity);
  }
}
