import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowModal {
  static void showbottomsheet(BuildContext context) {
      int isSelected = 0;

    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          return GestureDetector(
                            onTap: () {
                              setModalState(() {
                                isSelected = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 155.h,
                                width: 145.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: const Color(0xffE7EEEB),
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: 20.h,
                                            width: 20.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff0C5137),
                                                width: 1.5,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: isSelected == index
                                                ? Container(
                                                    margin: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xff0C5137,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 64.h,
                                        width: 64.h,
                                        child: Image.asset(
                                          'assets/icons/user.png',
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text('مستخدم', style: Styles.textStyle18),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).reversed.toList(),
                      ),
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