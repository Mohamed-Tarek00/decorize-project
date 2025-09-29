import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMoreViewBody extends StatelessWidget {
  const UserMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(onTap: () {}, headingText: 'المزيد'),
        Container(width: double.infinity, height: 20.h, color: Colors.white),
      ],
    );
  }
}
