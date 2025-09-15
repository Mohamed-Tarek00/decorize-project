abstract class OtpKeyState {}

class OtpKeyInitial extends OtpKeyState {}

class OtpKeyLoading extends OtpKeyInitial {}

class OtpKeyLoaded extends OtpKeyInitial {
  final Map<String, dynamic> response;
  OtpKeyLoaded(this.response);
}

class OtpKeyFailure extends OtpKeyInitial {
  final String errorMessage;
  OtpKeyFailure(this.errorMessage);
}
