import 'package:decorize_project/core/constants.dart';
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
        ],
      ),
    );
  }
}
