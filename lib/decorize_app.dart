import 'dart:async';

import 'package:decorize_project/core/router/app_router.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/log_out_stream.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DecorizeApp extends StatefulWidget {
  const DecorizeApp({super.key});

  @override
  State<DecorizeApp> createState() => _DecorizeAppState();
  
}

class _DecorizeAppState extends State<DecorizeApp> {
    StreamSubscription<String>? logoutSubscription;
  final logoutStream = getIt<LogoutStream>();
  @override
  void initState() {
    logoutSubscription = logoutStream.stream.listen((event) {
      if (event == 'logout') {
            context.go(AppRouterNames.loginView);

      }
    });
    super.initState();
  }
  @override
  void dispose() {
    logoutSubscription?.cancel();
    super.dispose();
  }
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
