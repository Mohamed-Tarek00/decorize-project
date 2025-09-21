import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/navigation_ad_details_buttons.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/submitted_offers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdDetailsViewBody extends StatelessWidget {
  const AdDetailsViewBody({super.key, required this.ad});
  final AdModel ad;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          CustomAppBar(
            headingText: 'تفاصيل الاعلان',
            onTap: () {
              context.pop();
            },
          ),
          Container(width: double.infinity, height: 20.h, color: Colors.white),
          SizedBox(height: 20.h),
          NavigationAdDetailsButtons(),

          // AdInformationSection(ad: ad),
          SubmittedOffersSection(),
        ],
      ),
    );
  }
}
