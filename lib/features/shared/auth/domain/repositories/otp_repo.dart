import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';

abstract class OtpRepo {
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(Verification entity);
}
