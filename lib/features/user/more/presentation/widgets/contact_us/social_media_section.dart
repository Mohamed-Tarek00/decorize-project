import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/contact_us/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedaiSection extends StatelessWidget {
  const SocialMedaiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'وسائل التواصل',
                style: Styles.textStyle18.copyWith(color: kPrimaryColor),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
