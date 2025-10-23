import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/user/more/domain/entities/edit_password_entity.dart';
import 'package:decorize_project/features/user/more/domain/usecases/edit_password_use_case.dart';
part 'edit_password_state.dart';

class EditPasswordCubit extends Cubit<EditPasswordState> {
  EditPasswordCubit(this.useCase) : super(EditPasswordInitial());
  final EditPasswordUseCase useCase;
  Future<void> editPassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(EditPasswordLoading());
    EditPasswordEntity entity = EditPasswordEntity(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    final result = await useCase(entity);
    result.fold(
      (failure) {
        emit(EditPasswordFailure(failure.toString()));
      },
      (data) {
        emit(EditPasswordSuccess(data));
      },
    );
  }
}
