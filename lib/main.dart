import 'package:decorize_project/core/router/app_router.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
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

class DecorizeApp extends StatelessWidget {
  const DecorizeApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: AppRouter.router,

      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      builder: (context, child) {
        ScreenUtil.init(context);
        return child!;
      },
    );
  }
}
