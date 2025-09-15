import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/Repo_Interface.dart';

class OtpVerificationUseCase {
  final Repositoryinterface repositoryinterface;
  OtpVerificationUseCase(this.repositoryinterface);
  Future<Either<Failure, Map<String, dynamic>>> call(
    Verification entity,
  ) async {
    return await repositoryinterface.sendOtpKey(entity);
  }
}
