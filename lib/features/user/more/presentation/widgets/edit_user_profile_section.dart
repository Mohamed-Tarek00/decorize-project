import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserProfileSection extends StatelessWidget {
  const EditUserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage('assets/design/worker_profile.png'),
              ),
              SizedBox(width: 10.w),
              Text('بلال محمود', style: Styles.textStyle16),
            ],
          ),
        ),
      ),
    );
  }
}
