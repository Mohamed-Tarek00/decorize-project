import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/app_router.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        context.go(AppRouter.kOnboardingview);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        children: [
          Center(child: Image.asset(kLogo, height: screenHeight * 0.1)),
          Center(
            child: Image.asset(kSplashBackground, height: screenHeight * .6),
          ),
          Positioned(
            bottom: screenHeight * 0.38,
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
