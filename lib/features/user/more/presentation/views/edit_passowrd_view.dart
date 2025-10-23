import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_password/edit_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPassowrdView extends StatelessWidget {
  const EditPassowrdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditPasswordViewBody(),
      backgroundColor: kScaffoldColor,
      bottomNavigationBar: Container(
        height: 80.h,
        color: Colors.white,
        child: Center(
          child: CustomButton(onPressed: () {}, text: 'تعديل'),
        ),
      ),
    );
  }
}
