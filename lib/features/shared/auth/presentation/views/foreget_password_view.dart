import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/forget_password_usecase.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForegetPasswordView extends StatelessWidget {
  const ForegetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPasswordCubit(getIt.get<ForgetPasswordUsecase>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          backgroundColor: kScaffoldColor,
          body: ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
