import 'package:dartz/dartz.dart' as user;
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/log/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/log/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButtonSection extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  const LoginButtonSection({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          final user = state.response.user;
          context.go(AppRouterNames.workerBottomNavigation, extra: user);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomLoadingIndicator();
        }
        return CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                LoginRequestEntity(
                  email: email.text.trim(),
                  password: password.text.trim(),
                ),
              );
            }
          },
          text: 'تسجيل الدخول',
        );
      },
    );
  }
}
