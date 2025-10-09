import 'package:bloc/bloc.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/features/shared/splash/domain/use_cases/check_token_usecase.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.checkTokenUseCase, this.cache) : super(SplashInitial());

  final CheckTokenUsecase checkTokenUseCase;
  final CacheHelper cache;

  Future<void> checkAuth() async {
    emit(SplashLoading());

    final Either<Failure, bool> result = await checkTokenUseCase();

    result.fold(
      (failure) async {
        //شيلنا مسح الداتا لان كده لو النت فصل او حصل اي خطأ  هتخرج اليوزر وده مش منطقي
        emit(SplashError(failure.errorMessage));
      },
      (isValid) async {
        if (!isValid) {
          await cache.clearUserData();
          emit(SplashUnauthenticated());
        } else {
          final type = await cache.getUserType();
          emit(SplashAuthenticated(type));
        }
      },
    );
  }
}
