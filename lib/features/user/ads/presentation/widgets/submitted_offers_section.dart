import 'package:decorize_project/features/user/ads/presentation/widgets/action_button.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/worker_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmittedOffersSection extends StatelessWidget {
  const SubmittedOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  WorkerCard(),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(text: 'قبول', onTap: () {}),
                      SizedBox(width: 10.w),
                      ActionButton(text: 'رفض', isFilled: false, onTap: () {}),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1.25.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
