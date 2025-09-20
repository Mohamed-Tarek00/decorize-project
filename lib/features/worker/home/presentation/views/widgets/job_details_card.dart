import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailsCard extends StatelessWidget {
  const JobDetailsCard({super.key});

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
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/home_images/image 16.png',
              width: 335.w,
              height: 150.h,
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
                      'مطلوب نجار',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomWorkerButton(
                      height: 22.h,
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
                SizedBox(height: 8.h),
                Text(
                  'نبحث عن نجار محترف ومبدع لتصميم غرفة مكتب أنيقة وعملية، حيث نرغب في أن تكون المساحة مريحة وعملية في نفس الوقت. نود أن تتضمن الغرفة عناصر تصميم مبتكرة، مثل أرفف مدمجة ومساحة عمل واسعة، بالإضافة إلى استخدام ألوان دافئة تضفي شعوراً بالراحة.',
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
