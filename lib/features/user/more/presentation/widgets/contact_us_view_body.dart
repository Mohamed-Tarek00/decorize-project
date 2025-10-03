import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

        Padding(
          padding: EdgeInsets.all(12.r),
          child: Container(
            width: 355.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'وسائل التواصل',
                    style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialMediaButton(icon: FontAwesomeIcons.xTwitter),
                      SocialMediaButton(icon: FontAwesomeIcons.facebookF),
                      SocialMediaButton(icon: FontAwesomeIcons.instagram),
                      SocialMediaButton(icon: FontAwesomeIcons.snapchat),
                      SocialMediaButton(icon: FontAwesomeIcons.tiktok),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
