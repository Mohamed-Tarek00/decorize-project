import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_button.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobDetailsAppBar(),
        SizedBox(height: 20.h),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/design/job_details_image.png',
                width: 335.w,
                height: 173.h,
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  CustomWorkerButton(
                    height: 32.h,
                    width: 67.w,
                    text: '200 \$',
                    color: Color(0xffE7EEEB),
                    textStyle: Styles.textStyle16.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
