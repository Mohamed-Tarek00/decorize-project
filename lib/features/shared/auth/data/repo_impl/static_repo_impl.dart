import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class StaticRepoImpl implements StaticRepo {
  final StaticDataSource staticDataSource;

  StaticRepoImpl({required this.staticDataSource});
  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      final items = await staticDataSource.getGovernorates();
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
      final items = await staticDataSource.getCitiesByGovernorateId(
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
      final items = await staticDataSource.getJobs();
      final jobs = items.map((job) => job.toEntity()).toList();
      return right(jobs);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
