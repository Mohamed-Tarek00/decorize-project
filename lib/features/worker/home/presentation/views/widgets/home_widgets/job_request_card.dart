import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_network_image.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class JobRequestCard extends StatelessWidget {
  const JobRequestCard({super.key, required this.job});
  final WorkerJobEntity job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouterNames.jobDetailsView, extra: job);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsetsDirectional.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: job.files![0].url,
              width: 311.w,
              height: 140.h,
              shape: ImageShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job.title,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${job.budget} ريال',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              job.content,
              style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),
            CustomWorkerButton(
              height: 40.h,
              width: 153.w,
              text: 'التقديم للطلب',
              textStyle: Styles.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
