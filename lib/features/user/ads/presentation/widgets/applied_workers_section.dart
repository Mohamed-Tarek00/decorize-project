import 'package:decorize_project/features/user/ads/presentation/widgets/custom_information_widget.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/worker_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppliedWorkersSection extends StatelessWidget {
  const AppliedWorkersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        WorkerCard(),
        Divider(color: Colors.grey.shade200, thickness: 1.25.h),
        WorkerCard(),
      ],
      iconPath: 'assets/icons/profile.svg',
      title: 'العامل',
    );
  }
}
