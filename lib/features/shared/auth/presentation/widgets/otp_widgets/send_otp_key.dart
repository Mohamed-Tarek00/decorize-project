import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendOtpKey extends StatelessWidget {
  const SendOtpKey({
    super.key,
    required this.otpController,
    required this.email,
    required this.purpose,
  });
  final TextEditingController otpController;
  final String email;
  final String purpose;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpKeyCubit, OtpKeyState>(
      listener: (context, state) async {
        if (state is OtpKeyLoaded) {
          final data = state.response;
          final user = data.user;
          final cache = getIt<CacheHelper>();
          await cache.saveUserData(user: data.user);
          await cache.saveToken(token: data.accessToken);
          if (!context.mounted) {
            return; // to avoid calling context if the widget is no longer in the tree
          }
          if (purpose == 'register' || purpose == 'login_verification') {
            if (user.type == 'client') {
              context.go(AppRouterNames.userNavigationBar);
            } else if (user.type == 'worker') {
              context.go(AppRouterNames.workerNavigationBar);
            }
          } else if (purpose == 'reset_password') {
            context.pushReplacement(AppRouterNames.resetPasswordView);
          }
        } else if (state is OtpKeyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage.toString())),
          );
        }
      },
      builder: (context, state) {
        if (state is OtpKeyLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              if (otpController.text.length < 4) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('الكود يجب ان يساوي 4 ارقام')),
                );
              } else {
                final entity = Verification(
                  email: email,
                  otpKey: otpController.text,
                );
                context.read<OtpKeyCubit>().sendOtpKey(entity);
              }
            },
            text: 'ارسال',
          );
        }
      },
    );
  }
}
