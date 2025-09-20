import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/information_order.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/navigation_ad_details_buttons.dart';
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
          Padding(
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
                SizedBox(height: 10),
                Text('${ad.subTitle}', style: Styles.textStyle14),
                SizedBox(height: 10.h),
                InformationOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
