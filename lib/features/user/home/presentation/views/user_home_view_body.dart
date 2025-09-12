import 'dart:ui' as BorderType;

import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/custom_user_app_bar.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/pick_multiple_images.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'اختر المكان',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 82.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PlaceModel.places.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 82.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(PlaceModel.places[index].placeImage),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
