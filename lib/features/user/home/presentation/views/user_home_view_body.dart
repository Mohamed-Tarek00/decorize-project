import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place_list_view.dart';
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
        SizedBox(height: 15.h),
        PickMultipleImages(),
        SizedBox(height: 15.h),
        ChoosePlace(),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.only(right: 12.w, bottom: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'اختر التصميم المناسب',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15.h),
              SizedBox(height: 75.h, child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}
