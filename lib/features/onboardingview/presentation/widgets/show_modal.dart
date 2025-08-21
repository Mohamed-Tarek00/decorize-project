import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/onboardingview/presentation/widgets/user_worker_selection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowModal {
  static void showbottomsheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 310.h,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/icons/close-circle.svg',
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                      Text('نوع المستخدم', style: Styles.textStyle20),
                      SizedBox(height: 5.h),
                      UserWorkerSelection(),
                      SizedBox(height: 10.h),
                      CustomButton(onPressed: () {}, text: 'التالي'.tr()),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
