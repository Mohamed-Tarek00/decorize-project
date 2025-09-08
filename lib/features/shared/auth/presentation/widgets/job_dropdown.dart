import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/job_cubit/cubit/job_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/job_cubit/cubit/job_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class JobDropdown extends StatelessWidget {
  const JobDropdown({
    super.key,
    required this.onChanged,
    required this.selectedJob,
  });
  final Job? selectedJob;
  final ValueChanged<Job?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الوظيفة', style: Styles.textStyle14),
          SizedBox(height: 8.h),
          Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                if (state is JobLoading) {
                  return Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is JobLoaded) {
                  final jobs = state.jobs;

                  return Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/bag.svg',
                        height: 27.h,
                        width: 27.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Job>(
                            hint: Text(
                              'اختر الوظيفة',
                              style: Styles.textStyle14,
                            ),
                            value: selectedJob,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: jobs.map((job) {
                              return DropdownMenuItem<Job>(
                                value: job,
                                child: Text(
                                  job.arName,
                                  style: Styles.textStyle14,
                                ),
                              );
                            }).toList(),
                            onChanged: onChanged,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is JobError) {
                  return Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Text(
                      'حدث خطأ: ${state.message}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
