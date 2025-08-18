import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(child: Image.asset(kLogo, height: 80)),
          Center(child: Image.asset(kSplashBackground, height: 450)),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Decorize'.tr(),
                style: Styles.textStyle28.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
