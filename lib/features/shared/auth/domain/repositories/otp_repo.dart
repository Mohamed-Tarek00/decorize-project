import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';

abstract class OtpRepo {
  Future<Either<Failure, AuthResponseEntity>> sendOtp(Verification entity);
}
