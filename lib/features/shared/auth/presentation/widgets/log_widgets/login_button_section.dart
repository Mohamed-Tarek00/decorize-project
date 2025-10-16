import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/login_request_entity.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class LoginButtonSection extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  final Position? position;

  const LoginButtonSection({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          final response = state.response;
          final user = state.response.user;
          final cache = getIt<CacheHelper>();
          await cache.saveUserData(authResponse: response);
          await cache.saveToken(token: response.accessToken);
          if (user.isVerified) {
            if (user.type.toLowerCase() == 'worker') {
              context.go(AppRouterNames.workerNavigationBar, extra: user);
            } else if (user.type.toLowerCase() == 'client') {
              context.go(AppRouterNames.userNavigationBar, extra: user);
            }
          } else {
            context.push(
              AppRouterNames.otpView,
              extra: {'email': user.email, 'purpose': 'login_verification'},
            );
          }
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
