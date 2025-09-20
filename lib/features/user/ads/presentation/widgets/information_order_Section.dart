import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationOrderSection extends StatelessWidget {
  const InformationOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        Row(
          children: [
            Text(
              'رقم الطلب',
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
            Spacer(),
            Text(
              '#123456',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              'تاريخ الطلب',
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
            Spacer(),
            Text(
              '28 يوليو 2024',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              'تاريخ الطلب',
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'جديد',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xff34C759),
              ),
            ),
          ],
        ),
      ],
      iconPath: 'assets/icons/information.svg',
      title: 'بيانات الطلب',
    );
  }
}
