import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_network_image.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/widgets/custom_worker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailsCard extends StatelessWidget {
  const JobDetailsCard({super.key, required this.job});
  final WorkerJobEntity job;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CustomNetworkImage(
            imageUrl: job.files![0].url,
            width: 335.w,
            height: 150.h,
            shape: ImageShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      job.title,
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomWorkerButton(
                      height: 22.h,
                      width: 67.w,
                      text: '${job.budget} \$',
                      color: Color(0xffE7EEEB),
                      textStyle: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  job.content,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
