import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/user/more/presentation/cubits/edit_password/edit_password_cubit.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_password/edit_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({super.key});

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditPasswordCubit>(),
      child: BlocConsumer<EditPasswordCubit, EditPasswordState>(
        listener: (context, state) {
          if (state is EditPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم تعديل كلمة المرور بنجاح ✅'),
                backgroundColor: Colors.green,
              ),
            );
            if (context.mounted) Navigator.pop(context);
          } else if (state is EditPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kScaffoldColor,
            body: AbsorbPointer(
              absorbing: state is EditPasswordLoading,
              child: EditPasswordViewBody(
                oldPasswordController: oldPasswordController,
                newPasswordController: newPasswordController,
                confirmPasswordController: confirmPasswordController,
              ),
            ),
            bottomNavigationBar: Container(
              height: 80.h,
              color: Colors.white,
              child: Center(
                child: state is EditPasswordLoading
                    ? const AbsorbPointer(child: CustomLoadingIndicator())
                    : CustomButton(
                        onPressed: () {
                          if (!mounted) return;

                          context.read<EditPasswordCubit>().editPassword(
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                        },
                        text: 'تعديل',
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
