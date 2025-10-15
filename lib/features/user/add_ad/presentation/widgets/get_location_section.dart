import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class GetLocationSection extends StatelessWidget {
  const GetLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouterNames.addLocationView);
      },
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    height: 18.h,
                    width: 18.w,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'العنوان على الخريطة',
                    style: Styles.textStyle14.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Divider(thickness: 1.h, color: kPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
