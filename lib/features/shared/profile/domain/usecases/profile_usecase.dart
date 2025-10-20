import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/repos/profile_repo.dart';

class ProfileUsecase {
  final ProfileRepo profileRepo;

  ProfileUsecase(this.profileRepo);

  Future<Either<Failure, UserEntity>> call() async {
    return await profileRepo.getProfile();
  }
}
