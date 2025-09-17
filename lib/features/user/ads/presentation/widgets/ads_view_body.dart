import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/searching_ads_section.dart';
import 'package:flutter/material.dart';

class AdsViewBody extends StatelessWidget {
  const AdsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(onTap: () {}, headingText: 'اعلاناتي'),
        SearchingAdsSection(),
      ],
    );
  }
}
