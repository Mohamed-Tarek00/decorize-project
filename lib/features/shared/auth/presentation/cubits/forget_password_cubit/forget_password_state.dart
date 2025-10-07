part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailuer extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailuer({required this.errorMessage});
}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordResponseEntity response;

  ForgetPasswordSuccess({required this.response});
}
