import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/splashview/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kPrimaryColor, body: SplashViewBody());
  }
}
