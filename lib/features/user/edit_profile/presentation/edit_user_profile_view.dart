import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/edit_profile/presentation/widgets/edit_user_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserProfileView extends StatelessWidget {
  const EditUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: EditUserProfileViewBody(),
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
