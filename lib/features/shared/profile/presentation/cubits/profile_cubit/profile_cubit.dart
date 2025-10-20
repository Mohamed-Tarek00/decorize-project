import 'package:bloc/bloc.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/usecases/profile_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase profileUsecase;

  ProfileCubit(this.profileUsecase) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      // 1️⃣ حاول تجيب البيانات من الكاش أولًا
      final cached = await getIt<CacheHelper>().getUserProfile();
      if (cached != null) {
        emit(ProfileLoaded(response: cached));
      }

      // 2️⃣ بعد كده اعمل Request لتحديث البيانات
      final result = await profileUsecase.call();
      result.fold(
        (failure) {
          if (state is! ProfileLoaded)
            emit(ProfileFailuer(errMessage: failure.errorMessage));
        },
        (user) async {
          await getIt<CacheHelper>().saveUserData(user: user);
          emit(ProfileLoaded(response: user));
        },
      );
    } catch (e) {
      emit(ProfileFailuer(errMessage: e.toString()));
    }
  }
}
