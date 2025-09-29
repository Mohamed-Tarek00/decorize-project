import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/edit_user_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMoreViewBody extends StatelessWidget {
  const UserMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(onTap: () {}, headingText: 'المزيد'),
        SizedBox(height: 20.h),
        EditUserProfileSection(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
