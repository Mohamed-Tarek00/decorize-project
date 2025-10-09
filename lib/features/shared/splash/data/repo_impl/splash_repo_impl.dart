import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/features/shared/splash/data/data_source/splash_remote_data_source.dart';
import 'package:decorize_project/features/shared/splash/domain/repo/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  final SplashRemoteDataSource splashRemoteDataSource;
  final CacheHelper cache;

  SplashRepoImpl(this.cache, this.splashRemoteDataSource);

  @override
  Future<Either<Failure, bool>> checkToken() async {
    final token = await cache.getToken();
    if (token == null) return right(false);

    try {
      final isValid = await splashRemoteDataSource.checkTokenValidity();
      return right(isValid);
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
