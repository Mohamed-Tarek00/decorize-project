import 'package:decorize_project/core/widgets/custom_searching_text_field.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/filteration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchingAdsSection extends StatelessWidget {
  const SearchingAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),

      child: Row(
        children: [
          CustomSearchingTextField(width: 260.w),
          FilterationButton(),
        ],
      ),
    );
  }
}
