import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sendOtpKey extends StatelessWidget {
  const sendOtpKey({super.key, required this.otpController, required this.email});
 final TextEditingController otpController ;
 final String email ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<OtpKeyCubit, OtpKeyState>(
                listener: (context, state) {
                  if (state is OtpKeyLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم ارسال الداتا بنجاح')),
                    );
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
                            SnackBar(
                              content: Text('الكود يجب ان يساوي 4 ارقام'),
                            ),
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