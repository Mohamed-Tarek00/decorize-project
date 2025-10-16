import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/reset_password_usecase.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kScaffoldColor,
        body: BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt.get<ResetPasswordUsecase>()),
          child: const ResetPasswordViewBody(),
        ),
      ),
    );
  }
}
