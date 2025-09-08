import 'package:dartz/dartz.dart';
import 'package:decorize_project/features/authantication/data/data_source/remote_data_source.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/data/models/register_request_model.dart';
import 'package:decorize_project/features/authantication/domain/entities/city.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';
import 'package:decorize_project/features/authantication/domain/entities/register_request.dart';
import 'package:decorize_project/features/authantication/domain/repositories/Repo_Interface.dart';

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

  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final items = await remoteDataSource.getJobs();
      final jobs = items.map((job) => job.toEntity()).toList();
      return right(jobs);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> sendRequest(RegisterRequest entity) async {
    try {
      final model = RegisterRequestModel(entity: entity);
      final response = await remoteDataSource.sendRegisterRequest(model);

      if (response.containsKey('errors')) {
        final errors = response['errors'] as Map<String, dynamic>;
        final errorMessage = errors.values.first[0];
        print('Error message extracted: $errorMessage');
        return left(ServiceFailure(errorMessage));
      }

      return right(null);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
