import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/otp_repo.dart';

class OtpRepoImpl implements OtpRepo {
  final SendOtpDataSource sendOtpDataSource;

  OtpRepoImpl({required this.sendOtpDataSource});

  @override
  Future<Either<Failure,AuthResponseEntity>> sendOtp(
    Verification entity,
  ) async {
    final model = VerificationModel.fromEntity(entity);
    return handleRequest<AuthResponseEntity>(
      request: () async { final response =await sendOtpDataSource.sendOtpKey(model) ;
      return response.toEntity(); }
    );
  }
}
