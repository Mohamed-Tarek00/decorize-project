import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AdDetailsViewBody extends StatelessWidget {
  const AdDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(headingText: 'تفاصيل الاعلان'),
      ],
    );
  }
}
