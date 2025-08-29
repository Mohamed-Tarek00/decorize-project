import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/repositories/location_repository.dart';

class GetGovernoratesUseCase {
  final LocationRepository repository;

  GetGovernoratesUseCase(this.repository);

  Future<Either<Failure, List<Governorate>>> get() async {
    return await repository.getGovernorates();
  }
}
