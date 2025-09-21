import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/applied_workers_section.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/information_order_Section.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/location_section.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/price_Section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdInformationSection extends StatelessWidget {
  const AdInformationSection({super.key, required this.ad});

  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              ad.imagePath,
              width: double.infinity,
              height: 130.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.h),
          Text(ad.subTitle, style: Styles.textStyle14),
          SizedBox(height: 15.h),
          InformationOrderSection(),
          SizedBox(height: 15.h),
          PriceSection(),
          SizedBox(height: 15.h),
          AppliedWorkersSection(),
          SizedBox(height: 15.h),
          LocationSection(),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
