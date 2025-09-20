import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/my_oreders_appbar.dart';
import 'package:flutter/material.dart';

class MyOrdersViewBody extends StatelessWidget {
  final VoidCallback? onBackToHome;
  const MyOrdersViewBody({super.key, this.onBackToHome});
  @override
  Widget build(BuildContext context) {
    return Column(children: [MyOrdersAppBar(onBackToHome: onBackToHome)]);
  }
}
