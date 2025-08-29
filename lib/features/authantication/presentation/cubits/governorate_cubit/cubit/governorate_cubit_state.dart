import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';

abstract class GovernorateState {}

class GovernorateInitial extends GovernorateState {}

class GovernorateLoading extends GovernorateState {}

class GovernorateLoaded extends GovernorateState {
  final List<Governorate> governorates;

  GovernorateLoaded(this.governorates);
}

class GovernorateError extends GovernorateState {
  final String message;

  GovernorateError(this.message);
}
