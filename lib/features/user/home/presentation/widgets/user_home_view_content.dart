import 'package:decorize_project/features/user/home/presentation/widgets/choose_design.dart';
import 'package:decorize_project/features/user/home/presentation/widgets/choose_place.dart';
import 'package:decorize_project/features/user/home/presentation/widgets/pick_multiple_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeViewContent extends StatelessWidget {
  const UserHomeViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        PickMultipleImages(),
        SizedBox(height: 12.h),
        ChoosePlace(),
        ChooseDesign(),
      ],
    );
  }
}
