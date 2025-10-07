import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/user_more/edit_user_profile_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/user_more/sign_out_and_clear_acount_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/user_more/user_more_second__section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/user_more/user_more_third_section.dart';
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                EditUserProfileSection(),
                UserMoreSecondSection(),
                UserMoreThirdSection(),
                SignOutAndClearAcountSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
