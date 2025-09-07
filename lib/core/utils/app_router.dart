import 'package:decorize_project/features/onboardingview/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/splashview/presentation/splash_view.dart';
import 'package:decorize_project/features/authantication/presentation/user_otp_auth.dart';
import 'package:decorize_project/features/authantication/presentation/user_register_view.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingview = '/onboardingview';
  static const kUserRegister = '/userRegisterview';
  static const kotpAuth = '/otpAuth';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kOnboardingview,
        builder: (BuildContext context, GoRouterState state) {
          final position = state.extra as Position;
          return OnBoardingView(position: position);
        },
      ),
      GoRoute(
        path: kUserRegister,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>;
          final role = extra['type'] as String;
          final position = extra['position'] as Position?;

          return UserRegisterView(role: role, position: position);
        },
      ),
      GoRoute(
        path: kotpAuth,
        builder: (BuildContext context, GoRouterState state) {
          final email = state.extra as String;

          return UserOtpAuth(email: email);
        },
      ),
    ],
  );
}
