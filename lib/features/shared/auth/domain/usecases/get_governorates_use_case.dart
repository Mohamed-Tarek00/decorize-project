import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class GetGovernoratesUseCase {
  final StaticRepo staticRepo;

  GetGovernoratesUseCase(this.staticRepo);

  Future<Either<Failure, List<Governorate>>> call() async {
    return await staticRepo.getGovernorates();
  }
}
