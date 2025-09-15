import 'package:dartz/dartz.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/remote_data_source.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/data/models/register_request_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/verification_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/Repo_Interface.dart';
import 'package:dio/dio.dart';

class RepositoryImpl implements Repositoryinterface {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      final items = await remoteDataSource.getGovernorates();
      final governorates = items.map((item) => item.toEntity()).toList();
      return right(governorates);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  ) async {
    try {
      final items = await remoteDataSource.getCitiesByGovernorateId(
        governorateId,
      );
      final cities = items.map((item) => item.toEntity()).toList();
      return right(cities);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final items = await remoteDataSource.getJobs();
      final jobs = items.map((job) => job.toEntity()).toList();
      return right(jobs);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendRequest(RegisterRequest entity) async {
    try {
      final model = RegisterRequestModel(entity: entity);
      final response = await remoteDataSource.sendRegisterRequest(model);

      return right(null);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
 @override
  Future<Either<Failure, Map<String, dynamic>>> sendOtpKey(
    Verification entity,
  ) async {
    try {
      final model = VerificationModel.fromEntity(entity);
      final response = await remoteDataSource.sendOtpKey(model);
      return right(response);
    } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
