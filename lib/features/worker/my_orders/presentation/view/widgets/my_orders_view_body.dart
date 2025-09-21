import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/order_card_list.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/order_status_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersViewBody extends StatelessWidget {
  final VoidCallback? onBackToHome;
  const MyOrdersViewBody({super.key, this.onBackToHome});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWorkerAppbar(onBackToHome: onBackToHome, title: 'طلباتي'),
        SizedBox(height: 20.h),
        const OrdersStatusSwitcher(),
        SizedBox(height: 16.h),
        const OrderCardList(),
      ],
    );
  }
}
