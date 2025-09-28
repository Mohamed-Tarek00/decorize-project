import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_banner_widget.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerHomeViewBody extends StatelessWidget {
  const WorkerHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).padding.top,
        ),
        const CustomAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  const CustomBannerWidget(),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('احدث الاعلانات', style: Styles.textStyle20),
                      Column(
                        children: [
                          Text(
                            'عرض الكل',
                            style: Styles.textStyle14.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            width: 56.w,
                            height: 1.h,
                            color: const Color(0xff0C5137),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  const JobList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
