import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/edit_profile/presentation/widgets/change_picture_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditUserProfileViewBody extends StatelessWidget {
  const EditUserProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'الملف الشخصي',
        ),
        SizedBox(height: 20.h),
        ChangePictureSection(),
        
      ],
    );
  }
}
