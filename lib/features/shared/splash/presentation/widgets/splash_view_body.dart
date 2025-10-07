import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/geo_locator.dart';
import 'package:decorize_project/core/utils/screen_size.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  void _startSplashSequence() async {
    Position? currentPosition = await SetLocation.getLocation();
    await Future.delayed(const Duration(seconds: 3), () async {
      final _cache = getIt<CacheHelper>();
      final String? token = await _cache.getToken();
      final String? type = await _cache.getUserType();
      if (token == null) {
        context.go(AppRouterNames.onBoardingView, extra: currentPosition);
      } else {
        if (type == 'client') {
          context.go(AppRouterNames.userNavigationBar, extra: currentPosition);
        } else if (type == 'worker') {
          context.go(AppRouterNames.workerHomeView, extra: currentPosition);
        }
        ;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
