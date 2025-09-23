import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/more_option_group.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/more_option_item.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_profile_header.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WorkerProfileViewBody extends StatelessWidget {
  const WorkerProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWorkerAppbar(title: 'الملف الشخصي'),
        SizedBox(height: 20.h),
        WorkerProfileHeader(),
        SizedBox(height: 28.h),
        MoreOptionsGroup(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          children: [
            MoreOptionItem(
              onTap: () => context.push(AppRouterNames.editworkerProfileView),
              iconPath: 'assets/icons/profile.svg',
              label: 'تعديل البيانات الشخصيه',
              iconColor: kPrimaryColor,
            ),
          ],
        ),
        MoreOptionsGroup(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          children: [
            MoreOptionItem(
              onTap: () => context.push(AppRouterNames.editworkerPasswordView),
              iconPath: 'assets/icons/lock.svg',
              label: 'تغيير كلمة المرور',
              iconColor: kPrimaryColor,
            ),
          ],
        ),
        MoreOptionsGroup(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          children: [
            MoreOptionItem(
              onTap: () => context.push(AppRouterNames.editworkerPhoneView),
              iconPath: 'assets/icons/call-calling.svg',
              label: 'تغيير رقم الهاتف',
              iconColor: kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
