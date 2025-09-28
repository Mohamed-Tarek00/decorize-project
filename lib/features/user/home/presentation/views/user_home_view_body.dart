import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/user_home_view_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        const CustomAppBar(),
        SizedBox(height: 14.h),
        Expanded(child: UserHomeViewContent()),
      ],
    );
  }
}
