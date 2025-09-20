import 'package:decorize_project/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.getWidgethighet(percantage: .07, context: context),
      width: ScreenSize.getWidgetWidth(percantage: .9, context: context),
      decoration: BoxDecoration(
        color: Color(0xff0C5137),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          height: 24.h,
          width: 24.w,
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
