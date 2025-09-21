import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersStatusSwitcher extends StatelessWidget {
  const OrdersStatusSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomWorkerButton(
              text: 'الطلبات الحالية',
              textStyle: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              height: 40.h,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomWorkerButton(
              text: 'الطلبات السابقة',
              textStyle: Styles.textStyle14.copyWith(color: kPrimaryColor),
              color: Colors.transparent,
              height: 40.h,
            ),
          ),
        ],
      ),
    );
  }
}
