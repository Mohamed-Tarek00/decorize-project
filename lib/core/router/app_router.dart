import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/presentation/views/foreget_password_view.dart';
import 'package:decorize_project/features/shared/auth/presentation/views/login_view.dart';
import 'package:decorize_project/features/shared/auth/presentation/views/reset_password_view.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/on_boarding_view.dart';
import 'package:decorize_project/features/shared/profile/domain/usecases/profile_usecase.dart';
import 'package:decorize_project/features/shared/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:decorize_project/features/shared/splash/presentation/splash_view.dart';
import 'package:decorize_project/features/shared/auth/presentation/views/otp_auth.dart';
import 'package:decorize_project/features/shared/auth/presentation/views/register_view.dart';
import 'package:decorize_project/features/user/add_ad/presentation/add_ad_view.dart';
import 'package:decorize_project/features/user/add_ad/presentation/add_location_view.dart';
import 'package:decorize_project/features/user/ads/presentation/ad_details_view.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/user/more/presentation/views/edit_password_view.dart';
import 'package:decorize_project/features/user/more/presentation/views/edit_user_profile_view.dart';
import 'package:decorize_project/features/user/more/presentation/views/contact_us_view.dart';
import 'package:decorize_project/features/user/more/presentation/views/privacy_policy_view.dart';
import 'package:decorize_project/features/user/more/presentation/views/saved_design_view.dart';
import 'package:decorize_project/features/user/more/presentation/views/terms_and_conditions_view.dart';
import 'package:decorize_project/features/worker/home/presentation/views/job_details_view.dart';
import 'package:decorize_project/features/user/user_navigation_bar.dart';
import 'package:decorize_project/features/worker/home/presentation/views/worker_home_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/edit_worker_password_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/edit_worker_phone_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/edit_worker_profile_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_more_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_password_otp_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_phone_otp.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_profile_view.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/my_orders_view.dart';
import 'package:decorize_project/features/worker/navigation/presentation/widgets/custom_worker_buttom_navbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: routerKey,
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

          return RegisterView(role: role, position: position);
        },
      ),

      GoRoute(
        path: AppRouterNames.otpView,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>;
          final String email = extra['email'];
          final String purpose = extra['purpose'];
          return OtpAuth(email: email, purpose: purpose);
        },
      ),
      GoRoute(
        path: AppRouterNames.loginView,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>?;
          final String? role = extra?['type'] as String?;
          final Position? position = extra?['position'] as Position?;
          return LoginView(position: position, role: role);
        },
      ),
      GoRoute(
        path: AppRouterNames.forgetPasswordView,
        builder: (BuildContext context, GoRouterState state) {
          return ForegetPasswordView();
        },
      ),
      GoRoute(
        path: AppRouterNames.resetPasswordView,
        builder: (BuildContext context, GoRouterState state) {
          return ResetPasswordView();
        },
      ),

      GoRoute(
        path: AppRouterNames.userNavigationBar,
        builder: (BuildContext context, GoRouterState state) {
          return const UserNavigationBar();
        },
      ),
      GoRoute(
        path: AppRouterNames.workerNavigationBar,
        builder: (BuildContext context, GoRouterState state) {
          final position = state.extra as Position?;
          return BlocProvider(
            create: (context) =>
                ProfileCubit(getIt.get<ProfileUsecase>())..loadProfile(),
            child: CustomWorkerBottomNavBar(position: position),
          );
        },
      ),
      GoRoute(
        path: AppRouterNames.workerHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerHomeView();
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
      GoRoute(
        path: AppRouterNames.workerMoreView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerMoreView();
        },
      ),
      GoRoute(
        path: AppRouterNames.workerProfileView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerProfileView();
        },
      ),
      GoRoute(
        path: AppRouterNames.editworkerProfileView,
        builder: (BuildContext context, GoRouterState state) {
          return EditWorkerProfileView();
        },
      ),
      GoRoute(
        path: AppRouterNames.editworkerPasswordView,
        builder: (BuildContext context, GoRouterState state) {
          return EditWorkerPasswordView();
        },
      ),
      GoRoute(
        path: AppRouterNames.editworkerPhoneView,
        builder: (BuildContext context, GoRouterState state) {
          return EditWorkerPhoneView();
        },
      ),
      GoRoute(
        path: AppRouterNames.workerPasswordOtpView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerPasswordOtpView();
        },
      ),
      GoRoute(
        path: AppRouterNames.workerPhoneOtpView,
        builder: (BuildContext context, GoRouterState state) {
          return WorkerPhoneOtpView();
        },
      ),
      GoRoute(
        path: AppRouterNames.adDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          AdModel ad = state.extra as AdModel;
          return AdDetailsView(ad: ad);
        },
      ),
      GoRoute(
        path: AppRouterNames.addAdView,
        builder: (BuildContext context, GoRouterState state) {
          return AddAdView();
        },
      ),
      GoRoute(
        path: AppRouterNames.savedDesignsView,
        builder: (BuildContext context, GoRouterState state) {
          return SavedDesignView();
        },
      ),
      GoRoute(
        path: AppRouterNames.termsAndConditionsView,
        builder: (BuildContext context, GoRouterState state) {
          return TermsAndConditionsView();
        },
      ),
      GoRoute(
        path: AppRouterNames.termsAndConditionsView,
        builder: (BuildContext context, GoRouterState state) {
          return TermsAndConditionsView();
        },
      ),
      GoRoute(
        path: AppRouterNames.privacyPolicyView,
        builder: (BuildContext context, GoRouterState state) {
          return PrivacyPolicyView();
        },
      ),
      GoRoute(
        path: AppRouterNames.editUserProfileView,
        builder: (BuildContext context, GoRouterState state) {
          return EditUserProfileView();
        },
      ),
      GoRoute(
        path: AppRouterNames.contactUsView,
        builder: (BuildContext context, GoRouterState state) {
          return ContactUsView();
        },
      ),
      GoRoute(
        path: AppRouterNames.addLocationView,
        builder: (BuildContext context, GoRouterState state) {
          return AddLocationView();
        },
      ),
      GoRoute(
        path: AppRouterNames.editPasswordView,
        builder: (BuildContext context, GoRouterState state) {
          return EditPasswordView();
        },
      ),
    ],
  );
}
