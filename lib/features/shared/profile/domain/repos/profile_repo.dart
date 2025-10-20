import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/entities/worker_details_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getProfile();
  Future<Either<Failure, WorkerDetailsEntity>> getWorkerDetails({
    required int workerId,
  });
}
