import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/auth_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/forget_password_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/login_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/register_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/reset_password_request_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordEntity entity,
  ) async {
    try {
      final model = ForgetPasswordModel(email: entity.email);
      final response = await authDataSource.forgetPasswordRequest(model: model);
      return right(response);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterRequest entity,
  ) async {
    final model = RegisterRequestModel(entity: entity);
    return handleRequest<AuthResponseEntity>(
      request: () async {
        final responseModel = await authDataSource.sendRegisterRequest(model);
        return responseModel.toEntity();
      },
    );
  }

  //المفروض هنا الراجع من الهاندل ريكويست موديل  مش انتيتي ف انت هنا لازم تعمل فانكشن جوا كل موديل تحول لانتيتي   انا عملت الفانكشن جوا  ال الاوث موديل
  @override
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequestEntity entity) {
    final model = LoginRequestModel(entity: entity);
    return handleRequest(
      request: () async => await authDataSource.loginRequest(model: model),
    );
  }

  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity entity,
  ) {
    final model = ResetPasswordRequestModel(entity: entity);
    return handleRequest(
      request: () async {
        final resetPasswordResponse = await authDataSource.resetPasswordRequest(
          model: model,
        );
        return resetPasswordResponse.toEntity();
      },
    );
  }
}
