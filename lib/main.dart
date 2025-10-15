import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/decorize_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await setupServiceLocator();  

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => const DecorizeApp(),
      ),
    ),
  );
}

