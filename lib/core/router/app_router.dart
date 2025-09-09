import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/shared/splash/presentation/splash_view.dart';
import 'package:decorize_project/features/shared/auth/presentation/user_otp_auth.dart';
import 'package:decorize_project/features/shared/auth/presentation/user_register_view.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRouterNames.splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: AppRouterNames.onBoardingView,
        builder: (BuildContext context, GoRouterState state) {
          final position = state.extra as Position;
          return OnBoardingView(position: position);
        },
      ),
      GoRoute(
        path: AppRouterNames.registerView,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>;
          final role = extra['type'] as String;
          final position = extra['position'] as Position?;

          return UserRegisterView(role: role, position: position);
        },
      ),
      GoRoute(
        path: AppRouterNames.otpView,
        builder: (BuildContext context, GoRouterState state) {
          final email = state.extra as String;

          return UserOtpAuth(email: email);
        },
      ),
    ],
  );
}
