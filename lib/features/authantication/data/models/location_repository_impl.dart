import 'package:dartz/dartz.dart';
import 'package:decorize_project/features/authantication/data/data_source/location_remote_data_source.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      final items = await remoteDataSource.getGovernorates();
      final entities = items.map((item) => item.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
