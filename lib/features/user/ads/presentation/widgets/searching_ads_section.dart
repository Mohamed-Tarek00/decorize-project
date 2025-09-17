import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_searching_text_field.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/filteration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchingAdsSection extends StatelessWidget {
  const SearchingAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),

        child: Row(children: [CustomSearchingTextField(), FilterationButton()]),
      ),
    );
  }
}
