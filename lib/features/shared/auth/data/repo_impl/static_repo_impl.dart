import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/models/city_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/governorate_model.dart';
import 'package:decorize_project/features/shared/auth/data/models/job_model.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class StaticRepoImpl implements StaticRepo {
  final StaticDataSource staticDataSource;

  StaticRepoImpl({required this.staticDataSource});
  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    return await handleRequest(
      request: () async => await staticDataSource.getGovernorates(),
      converter: (json) {
        final listOfGoverments = json['data'] as List;
        List<GovernorateModel> goveronrates = listOfGoverments
            .map((item) => GovernorateModel.fromJson(item))
            .toList();
        return goveronrates
            .map((govenrorate) => govenrorate.toEntity())
            .toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  ) async {
    return await handleRequest(
      request: () async =>
          await staticDataSource.getCitiesByGovernorateId(governorateId),
      converter: (json) {
        final listOfCities = json['data'] as List;
        List<CityModel> cities = listOfCities
            .map((item) => CityModel.fromJson(item))
            .toList();
        return cities.map((city) => city.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    return handleRequest(
      request: () async => await staticDataSource.getJobs(),
      converter: (json) {
        final ListOfJobs = json['data'] as List;
        List<JobModel> jobs = ListOfJobs.map(
          (item) => JobModel.fromJson(item),
        ).toList();
        return jobs.map((job) => job.toEntity()).toList();
      },
    );
  }
}
