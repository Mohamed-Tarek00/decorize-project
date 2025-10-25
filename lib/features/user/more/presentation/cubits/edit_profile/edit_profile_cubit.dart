import 'package:bloc/bloc.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_profile_entity.dart';
import 'package:decorize_project/features/user/more/domain/usecases/edit_profile_use_case.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.useCase) : super(EditProfileInitial());
  final EditProfileUseCase useCase;
  Future<void> editProfile({
    required String name,
    required String phone,
  }) async {
    emit(EditProfileLoading());
    EditProfileEntity entity = EditProfileEntity(name: name, phone: phone);
    final result = await useCase(entity: entity);
    result.fold(
      (failure) {
        emit(EditProfileFailure(failure.toString()));
      },
      (data) async {
        emit(EditProfileSuccess(data));

        await getIt<CacheHelper>().saveUserData(user: data);
      },
    );
  }
}
