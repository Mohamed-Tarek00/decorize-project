import 'dart:io';
import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/routes/app_routes_name.dart';
import 'package:decorize_project/core/utils/screen_size.dart';
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
  Position? currentPosition;
  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    Position? position;
    if (Platform.isAndroid) {
      position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.high),
      );
      setState(() {
        currentPosition = position;
      });
    } else if (Platform.isIOS) {
      position = await Geolocator.getCurrentPosition(
        locationSettings: AppleSettings(accuracy: LocationAccuracy.best),
      );
      setState(() {
        currentPosition = position;
      });
    }
  }

  void _startSplashSequence() async {
    await _getLocation();
    await Future.delayed(const Duration(seconds: 3), () {
      context.go(AppRoutesName.onBoardingView, extra: currentPosition);
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
              percantage: 0.38,
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
