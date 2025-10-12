
import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/auth_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/forget_password_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/login_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/register_request_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
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
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginRequestEntity entity,
  ) async {
    try {
      final model = LoginRequestModel(
        email: entity.email,
        password: entity.password,
        deviceToken: entity.deviceToken,
      );
      final response = await authDataSource.loginRequest(model: model);
      return right(response);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterRequest entity) async {
 
      final model = RegisterRequestModel(entity: entity);
      return handleRequest<void>(request: ()=>authDataSource.sendRegisterRequest(model), converter: (_){ });
      
  }
}

