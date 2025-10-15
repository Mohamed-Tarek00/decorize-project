import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';

abstract class OtpKeyState {}

class OtpKeyInitial extends OtpKeyState {}

class OtpKeyLoading extends OtpKeyInitial {}

class OtpKeyLoaded extends OtpKeyInitial {
  final AuthResponseEntity response;
  OtpKeyLoaded(this.response);
}

class OtpKeyFailure extends OtpKeyInitial {
  final String errorMessage;
  OtpKeyFailure(this.errorMessage);
}
