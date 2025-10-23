part of 'edit_password_cubit.dart';

abstract class EditPasswordState {}

class EditPasswordInitial extends EditPasswordState {}

class EditPasswordLoading extends EditPasswordState {}

class EditPasswordSuccess extends EditPasswordState {
  final Map<String, dynamic> response;
  EditPasswordSuccess(this.response);
}

class EditPasswordFailure extends EditPasswordState {
  final String error;
  EditPasswordFailure(this.error);
}
