import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';

abstract class SplashRepo {
  Future<Either<Failure, bool>> checkToken();
}
