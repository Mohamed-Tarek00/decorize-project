import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_profile_entity.dart';
import 'package:decorize_project/features/user/more/domain/repo/more_repo.dart';

class EditProfileUseCase {
  final MoreRepo repo;
  EditProfileUseCase({required this.repo});
  Future<Either<Failure, UserEntity>> call({
    required EditProfileEntity entity,
  }) async {
    return await repo.editProfile(entity: entity);
  }
}
