import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  final VoidCallback? onBackToHome;

  const MyOrdersView({super.key, this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: MyOrdersViewBody(onBackToHome: onBackToHome),
    );
  }
}
