import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/splash/domain/use_cases/check_token_usecase.dart';
import 'package:decorize_project/features/shared/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:decorize_project/features/shared/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SplashCubit(getIt<CheckTokenUsecase>(), getIt<CacheHelper>()),
      child: Scaffold(backgroundColor: kPrimaryColor, body: SplashViewBody()),
    );
  }
}
