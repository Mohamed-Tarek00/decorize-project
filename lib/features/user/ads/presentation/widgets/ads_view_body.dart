import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsViewBody extends StatelessWidget {
  const AdsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(onTap: () {}, headingText: 'اعلاناتي'),
        Row(
          children: [
            Container(
              height: 40.h,
              width: 287.w,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث هنا...',
                  hintStyle: Styles.textStyle14.copyWith(
                    color: Color(0xff8B8B8B),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 36.w,
                    minHeight: 36.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xffE6E6E6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
