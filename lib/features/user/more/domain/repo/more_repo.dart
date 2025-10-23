import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';

abstract class MoreRepo {
  Future<Either<Failure, Map<String, dynamic>>> editPassword({
    required EditPasswordEntity entity,
  });
}
