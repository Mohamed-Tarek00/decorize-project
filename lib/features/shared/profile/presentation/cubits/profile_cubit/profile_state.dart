part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFailuer extends ProfileState {
  final String errMessage;

  const ProfileFailuer({required this.errMessage});
}

final class ProfileLoaded extends ProfileState {
  final UserEntity response;

  const ProfileLoaded({required this.response});
}
