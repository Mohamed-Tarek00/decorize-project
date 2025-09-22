import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  final VoidCallback? onBackToHome;

  const MyOrdersView({super.key, this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: MyOrdersViewBody(onBackToHome: onBackToHome),
    );
  }
}
