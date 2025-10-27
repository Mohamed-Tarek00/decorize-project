part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final UserEntity response;
  EditProfileSuccess(this.response);
}

class EditProfileFailure extends EditProfileState {
  final String error;
  EditProfileFailure(this.error);
}
