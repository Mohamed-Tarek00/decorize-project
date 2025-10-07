import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/otp_repo.dart';
import 'package:dio/dio.dart';

class OtpRepoImpl implements OtpRepo {
  final SendOtpDataSource sendOtpDataSource;

  OtpRepoImpl({required this.sendOtpDataSource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(
    Verification entity,
  ) async {
    try {
      final model = VerificationModel.fromEntity(entity);
      final response = await sendOtpDataSource.sendOtpKey(model);
      return right(response);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
