import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/custom_profile_text_field.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditWorkerPasswordViewBody extends StatelessWidget {
  const EditWorkerPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWorkerAppbar(title: 'تغيير كلمة المرور'),
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              CustomProfileTextField(
                label: 'كلمة المرور القديمة',
                hint: '***************',
                iconPath: 'assets/icons/lock.svg',
              ),
              SizedBox(height: 12.h),
              CustomProfileTextField(
                label: 'كلمة المرور الجديدة',
                hint: '***************',
                iconPath: 'assets/icons/lock.svg',
              ),
              SizedBox(height: 12.h),
              CustomProfileTextField(
                label: 'تأكيد كلمة المرور',
                hint: '***************',
                iconPath: 'assets/icons/lock.svg',
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: Colors.white,
          child: CustomWorkerButton(
            onTap: () =>
                context.pushReplacement(AppRouterNames.workerPasswordOtpView),
            height: 40.h,
            width: double.infinity,
            text: 'حفظ',
            textStyle: Styles.textStyle14.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
