part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordCubitInitial extends ResetPasswordState {}

final class ResetPasswordCubitLoading extends ResetPasswordState {}

final class ResetPasswordCubitFailuer extends ResetPasswordState {
  final String errMessage;

  ResetPasswordCubitFailuer({required this.errMessage});
}

final class ResetPasswordCubitSuccess extends ResetPasswordState {
  final ResetPasswordResponseEntity response;

  ResetPasswordCubitSuccess({required this.response});
}
