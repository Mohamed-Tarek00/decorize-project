import 'package:decorize_project/features/onboardingview/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/splashview/presentation/splash_view.dart';
import 'package:decorize_project/features/userregisterview/presentation/user_otp_auth.dart';
import 'package:decorize_project/features/userregisterview/presentation/user_register_view.dart';
import 'package:flutter/widgets.dart';
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
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: kUserRegister,
        builder: (BuildContext context, GoRouterState state) {
          return const UserRegisterView();
        },
      ),
       GoRoute(
        path: kotpAuth,
        builder: (BuildContext context, GoRouterState state) {
          return const UserOtpAuth();
        },
      ),
    ],
  );
}
