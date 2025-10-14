import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/geo_locator.dart';
import 'package:decorize_project/core/utils/screen_size.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  Future<void> _initSplash() async {
    currentPosition = await SetLocation.getLocation();
    Future.delayed(const Duration(seconds: 2), () {
      context.read<SplashCubit>().checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          if (state.userType == 'client') {
            context.go(
              AppRouterNames.userNavigationBar,
              extra: currentPosition,
            );
          } else if (state.userType == 'worker') {
            context.go(
              AppRouterNames.workerNavigationBar,
              extra: currentPosition,
            );
          }
        } else if (state is SplashUnauthenticated) {
          context.go(AppRouterNames.onBoardingView, extra: currentPosition);
        }
      },
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                kLogo,
                height: ScreenSize.getWidgethighet(
                  percantage: .1,
                  context: context,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                kSplashBackground,
                height: ScreenSize.getWidgethighet(
                  percantage: .6,
                  context: context,
                ),
              ),
            ),
            Positioned(
              bottom: ScreenSize.getWidgethighet(
                percantage: .38,
                context: context,
              ),
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Decorize'.tr(),
                  style: Styles.textStyle32.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
