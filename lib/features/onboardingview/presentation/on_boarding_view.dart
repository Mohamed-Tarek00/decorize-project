import 'package:decorize_project/features/onboardingview/presentation/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key, required this.position});
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: OnBoardingViewBody(position: position),
    );
  }
}
