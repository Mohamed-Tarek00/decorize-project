import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        Container(
          width: double.infinity,
          child: Image.asset('assets/icons/Map.png', fit: BoxFit.cover),
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              height: 16.h,
              width: 16.w,
              color: Color(0xff353535),
            ),
            SizedBox(width: 5.w),
            Text('المنطقة , المدينه , الحي ', style: Styles.textStyle12),
          ],
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Text(
            '64 شارع وادي الجيج , مقابل مطعم ومشويات نافورة حماه,الخُبر ,  الحي 64 شارع وادي الجيج,مقابل مطعم ومشويات نافورة حماه,الخُبر',
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
      iconPath: 'assets/icons/location.svg',
      title: 'العنوان',
    );
  }
}
