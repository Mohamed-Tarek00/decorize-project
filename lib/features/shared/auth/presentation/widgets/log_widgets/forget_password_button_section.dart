import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButtonSection extends StatelessWidget {
  const ForgetPasswordButtonSection({
    super.key,
    required this.email,
    required this.formKey,
  });
  final TextEditingController email;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          final user = state.response.user;
          debugPrint("✅ Verification Code: ${state.response.verificationCode}");
          debugPrint("✅ User Email: ${user.email}");

          context.push(
            AppRouterNames.otpView,
            extra: {'email': user.email, 'purpose': 'reset_password'},
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 5,
              backgroundColor: kPrimaryColor,
              content: Text(
                '✅ Verification Code: ${state.response.verificationCode}',
              ),
            ),
          );
        } else if (state is ForgetPasswordFailuer) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const CustomLoadingIndicator();
        }
        return CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgetPasswordCubit>().forgetPassword(
                email: email.text.trim(),
              );
            }
          },
          text: 'تسجيل الدخول',
        );
      },
    );
  }
}
