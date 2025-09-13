import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_design_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseDesign extends StatelessWidget {
  const ChooseDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 12.w, top: 6.h),
          child: Text(
            'اختار التصميم',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
          child: ChooseDesignGridView(),
        ),
      ],
    );
  }
}
