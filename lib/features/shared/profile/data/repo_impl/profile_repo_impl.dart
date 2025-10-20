import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/shared/profile/data/data_source/profile_data_source.dart';
import 'package:decorize_project/features/shared/profile/domain/entities/worker_details_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource profileDataSource;

  ProfileRepoImpl(this.profileDataSource);

  @override
  Future<Either<Failure, UserEntity>> getProfile() {
    return handleRequest<UserEntity>(
      request: () async {
        final model = await profileDataSource.getProfile();
        return model.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, WorkerDetailsEntity>> getWorkerDetails({
    required int workerId,
  }) {
    return handleRequest<WorkerDetailsEntity>(
      request: () async {
        final model = await profileDataSource.getWorkerDetails(
          workerId: workerId,
        );
        return model.toEntity();
      },
    );
  }
}
