import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/social_media_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'تواصل معنا',
        ),
        SizedBox(height: 20.h),

        SocialMedaiSection(),
      ],
    );
  }
}
