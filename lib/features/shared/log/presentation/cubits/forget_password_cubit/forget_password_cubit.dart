import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/use_cases/forget_password_usecase.dart';
import 'package:meta/meta.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUsecase(
      ForgetPasswordEntity(email: email),
    );

    result.fold(
      (failuer) =>
          emit(ForgetPasswordFailuer(errorMessage: failuer.errorMessage)),
      (response) => emit(ForgetPasswordSuccess(response: response)),
    );
  }
}
