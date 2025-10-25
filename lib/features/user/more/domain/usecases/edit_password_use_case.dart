import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';
import 'package:decorize_project/features/user/more/domain/repo/more_repo.dart';

class EditPasswordUseCase {
  final MoreRepo repo;
  EditPasswordUseCase(this.repo);
  Future<Either<Failure, Map<String, dynamic>>> call(
    EditPasswordEntity entity,
  ) async {
    final result = await repo.editPassword(entity: entity);
    return result;
  }
}
