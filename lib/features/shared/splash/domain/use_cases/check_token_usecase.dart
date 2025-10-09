import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/splash/domain/repo/splash_repo.dart';

class CheckTokenUsecase {
  final SplashRepo splashRepo;

  CheckTokenUsecase(this.splashRepo);

  Future<Either<Failure, bool>> call() async {
    return await splashRepo.checkToken();
  }
}
