import 'dart:ui' as BorderType;

import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place.dart';
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
      children: [
        CustomUserAppBar(),
        SizedBox(height: 20.h),
        PickMultipleImages(),
        SizedBox(height: 20.h),
        ChoosePlace(),
      ],
    );
  }
}
