import 'dart:ui' as BorderType;

import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/custom_user_app_bar.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/pick_multiple_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomUserAppBar(),
        SizedBox(height: 20.h),
        PickMultipleImages(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Text(
            'اختر المكان',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
