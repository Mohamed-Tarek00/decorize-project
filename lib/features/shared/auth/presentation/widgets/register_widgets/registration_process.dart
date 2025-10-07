import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/register_request_cubit/cubit/register_request_cubit_.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/register_request_cubit/cubit/register_request_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class registrationProcess extends StatelessWidget {
  const registrationProcess({
    super.key,
    required this.emailController,
    required this.formKey,
    required this.passwordController,
    required this.nameController,
    required this.isAgreed,
    required this.phoneController,
    required this.governorate,
    required this.city,
    this.job,
    required this.role,
  });
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final bool isAgreed;
  final TextEditingController phoneController;
  final Governorate? governorate;
  final City? city;
  final Job? job;
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.push(
            AppRouterNames.otpView,
            extra: emailController.text.trim(),
          );
        } else if (state is RegisterFailure) {
          print(state.message);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              // context.go(AppRouterNames.userNavigationBar);
           if (formKey.currentState!.validate()) {
                if (!isAgreed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('يجب الموافقة على الشروط والأحكام')),
                  );
                  return;
                }

                if (governorate == null || city == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('من فضلك اختر المحافظة والمدينة')),
                  );
                  return;
                }

                if (role == 'worker' && job == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('من فضلك اختر الوظيفة')),
                  );
                  return;
                }
                context.read<RegisterCubit>().register(
                  RegisterRequest(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    phone: phoneController.text,
                    type: role,
                    governorateId: governorate!.id,
                    cityId: city!.id,
                    typeId: role == 'worker' ? job?.id.toString() : null,
                  ),
                );
              }
            },
            text: 'انشاء حساب',
          );
        }
      },
    );
  }
}
