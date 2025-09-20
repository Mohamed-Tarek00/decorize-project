import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class JobRequestCard extends StatelessWidget {
  const JobRequestCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouterNames.jobDetailsView);
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
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                'assets/home_images/image 16.png',
                width: 311.w,
                height: 163.h,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مطلوب نجار',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '500 ريال',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'نبحث عن نجار محترف ومبدع لتصميم غرفة مكتب أنيقة وعملية، حيث نرغب في أن تكون المساحة مريحة وعملية في نفس الوقت. قراءة المزيد',
              style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.h),
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
