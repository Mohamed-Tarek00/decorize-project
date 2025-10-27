import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/user/more/data/data_source/more_data_source.dart';
import 'package:decorize_project/features/user/more/data/models/edit_password_model.dart';
import 'package:decorize_project/features/user/more/data/models/edit_profile_model.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_profile_entity.dart';
import 'package:decorize_project/features/user/more/domain/repo/more_repo.dart';

class MoreRepoImp implements MoreRepo {
  final MoreDataSource _dataSource;
  MoreRepoImp(this._dataSource);
  @override
  Future<Either<Failure, Map<String, dynamic>>> editPassword({
    required EditPasswordEntity entity,
  }) async {
    final model = EditPasswordModel.fromEntity(entity);
    return handleRequest<Map<String, dynamic>>(
      request: () async {
        final response = await _dataSource.editPassword(model: model);
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity>> editProfile({
    required EditProfileEntity entity,
  }) async {
    final model = EditProfileModel.fromEntity(entity);
    return handleRequest<UserEntity>(
      request: () async {
        final response = await _dataSource.editProfile(model: model);
        final userEntity = response.toEntity();
        return userEntity;
      },
    );
  }
}
