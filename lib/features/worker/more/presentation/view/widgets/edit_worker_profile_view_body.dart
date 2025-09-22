import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/edit_profile_form.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_profile_header.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWorkerProfileViewBody extends StatelessWidget {
  const EditWorkerProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWorkerAppbar(title: 'الملف الشخصي'),
          SizedBox(height: 20.h),
          WorkerProfileHeader(),
          SizedBox(height: 24.h),
          EditProfileForm(),
          SizedBox(height: 50.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Colors.white,
            child: CustomWorkerButton(
              onTap: () {},
              height: 40.h,
              width: double.infinity,
              text: 'تعديل',
              textStyle: Styles.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
