import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/reset_password_request_entity.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordButtonSectiion extends StatelessWidget {
  const ResetPasswordButtonSectiion({
    super.key,
    required this.newPassword,
    required this.newPasswordConfirmation,
    required this.formKey,
  });
  final TextEditingController newPassword;
  final TextEditingController newPasswordConfirmation;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordCubitSuccess) {
          final response = state.response;
          final cache = getIt<CacheHelper>();
          cache.saveToken(token: response.accessToken);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تغيير كلمة المرور بنجاح ✅')),
          );
          context.go(AppRouterNames.loginView);
        } else if (state is ResetPasswordCubitFailuer) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordCubitLoading) {
          return const CustomLoadingIndicator();
        }
        return CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ResetPasswordCubit>().resetPassword(
                entity: ResetPasswordRequestEntity(
                  password: newPassword.text.trim(),
                  passwordConfirmation: newPasswordConfirmation.text.trim(),
                ),
              );
            }
          },
          text: 'إرسال',
        );
      },
    );
  }
}
