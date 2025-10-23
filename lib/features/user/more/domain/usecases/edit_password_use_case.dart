import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/user/more/data/repo_impl/more_repo_imp.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';

class EditPasswordUseCase {
  final MoreRepoImp repo;
  EditPasswordUseCase(this.repo);
  Future<Either<Failure, Map<String, dynamic>>> call(
    EditPasswordEntity entity,
  ) async {
    final result = await repo.editPassword(entity: entity);
    return result;
  }
}
