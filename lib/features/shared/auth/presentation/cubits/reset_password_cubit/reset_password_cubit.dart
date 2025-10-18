import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/reset_password_usecase.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordCubit(this.resetPasswordUsecase)
    : super(ResetPasswordCubitInitial());

  Future<void> resetPassword({
    required ResetPasswordRequestEntity entity,
  }) async {
    print('🟡 inside cubit');

    emit(ResetPasswordCubitLoading());
    final result = await resetPasswordUsecase.call(entity);
    result.fold(
      (failuer) =>
          emit(ResetPasswordCubitFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(ResetPasswordCubitSuccess(response: response)),
    );
  }
}
