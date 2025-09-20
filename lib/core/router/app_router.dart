import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/shared/splash/presentation/splash_view.dart';
import 'package:decorize_project/features/shared/auth/presentation/user_otp_auth.dart';
import 'package:decorize_project/features/shared/auth/presentation/user_register_view.dart';
import 'package:decorize_project/features/user/ads/presentation/ad_details_view.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/worker/home/presentation/views/job_details_view.dart';
import 'package:decorize_project/features/user/user_navigation_bar.dart';
import 'package:decorize_project/features/worker/home/presentation/views/worker_home_view.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/my_orders_view.dart';
import 'package:decorize_project/features/worker/navigation/presentation/widgets/custom_worker_buttom_navbar.dart';
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
      GoRoute(
        path: AppRouterNames.workerHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerHomeView();
        },
      ),
      GoRoute(
        path: AppRouterNames.userNavigationBar,
        builder: (BuildContext context, GoRouterState state) {
          return const UserNavigationBar();
        },
      ),

      GoRoute(
        path: AppRouterNames.workerBottomNavigation,
        builder: (BuildContext context, GoRouterState state) {
          return CustomWorkerBottomNavBar();
        },
      ),
      GoRoute(
        path: AppRouterNames.jobDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return JobDetailsView();
        },
      ),
      GoRoute(
        path: AppRouterNames.ordersView,
        builder: (BuildContext context, GoRouterState state) {
          return MyOrdersView();
        },
      ),
    ],
  );
}
