part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashAuthenticated extends SplashState {
  final String? userType;
  SplashAuthenticated(this.userType);
}

class SplashUnauthenticated extends SplashState {}

class SplashError extends SplashState {
  final String message;
  SplashError(this.message);
}
