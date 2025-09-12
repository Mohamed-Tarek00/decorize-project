import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PickMultipleImages extends StatelessWidget {
  const PickMultipleImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(12.r),
            color: Color(0xffb4c9c1),
            dashPattern: [14, 8],
            strokeWidth: 2,
          ),
          child: Container(
            width: 335.w,
            height: 122.h,
            color: Color(0xffe7eeeb),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 8.h),

                Text(
                  'التقط صورة لمساحتك',
                  style: Styles.textStyle16.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'ابدأ بتصوير المساحة التي ترغب بتصميمها، وسنقترح لك أفضل التصاميم!',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.all(12.h),

                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التقط صورة لمساحتك',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/camera.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
