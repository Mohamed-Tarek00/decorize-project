import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/order_cancel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const OrderCard({super.key, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '#123456',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff8B8B8B),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset('assets/icons/calendar.svg'),
                SizedBox(width: 4.w),
                Text(
                  '12 مارس , 2024',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff8B8B8B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/design/order_image.png',
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'تصميم غرفة مكتب',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xff34C759).withOpacity(.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'مكتمل',
                    style: Styles.textStyle12.copyWith(
                      color: const Color(0xff34C759),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset('assets/icons/dollar-square.svg'),
                SizedBox(width: 4.w),
                Text(
                  '200 ريال',
                  style: Styles.textStyle16.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if (isSelected)
              GestureDetector(
                onTap: () => OrderCancelBottomSheet.show(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    border: Border.all(color: kErrorColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'إلغاء الطلب',
                    style: Styles.textStyle12.copyWith(color: kErrorColor),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
