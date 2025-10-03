import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/log/data/data_soerce/login_remote_data_source.dart';
import 'package:decorize_project/features/shared/log/data/models/login_request_model.dart';
import 'package:decorize_project/features/shared/log/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/log/domain/repos/login_repo.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepoImpl({required this.remoteDataSource});

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
      final response = await remoteDataSource.loginRequest(model: model);
      return right(response);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
