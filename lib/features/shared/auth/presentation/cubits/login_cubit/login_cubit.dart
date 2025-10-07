import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginCubitInitial());

  Future<void> login(LoginRequestEntity entity) async {
    emit(LoginLoading());
    final result = await loginUsecase.call(entity);
    result.fold(
      (failuer) => emit(LoginFailure(errorMessage: failuer.errorMessage)),
      (response) => emit(LoginSuccess(response: response)),
    );
  }
}
