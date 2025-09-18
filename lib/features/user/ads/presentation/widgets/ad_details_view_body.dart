import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/sided_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdDetailsViewBody extends StatelessWidget {
  const AdDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SidedRoundedButton(isRight: true),
            Container(height: 40, width: 1, color: Colors.grey.shade200),
            SidedRoundedButton(isRight: false),
          ],
        ),
      ],
    );
  }
}
