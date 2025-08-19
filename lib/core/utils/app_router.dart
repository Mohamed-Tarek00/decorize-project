import 'package:decorize_project/features/onboardingview/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/splashview/presentation/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingview = '/onboardingview';

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
    ],
  );
}
