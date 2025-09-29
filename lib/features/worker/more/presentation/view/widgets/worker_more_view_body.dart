import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/more_option_group.dart';
import 'package:decorize_project/core/widgets/more_option_item.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_profile_card.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerMoreViewBody extends StatelessWidget {
  const WorkerMoreViewBody({super.key, this.onBackToHome});
  final VoidCallback? onBackToHome;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWorkerAppbar(title: 'المزيد', onBackToHome: onBackToHome),
          SizedBox(height: 20.h),
          const WorkerProfileCard(),
          MoreOptionsGroup(
            children: [
              MoreOptionItem(
                iconPath: 'assets/icons/information.svg',
                label: 'الشروط والاحكام',
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/message-2.svg',
                label: 'الدردشه',
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/security-safe.svg',
                label: 'سياسة الخصوصيه',
              ),
            ],
          ),
          MoreOptionsGroup(
            children: [
              MoreOptionItem(
                iconPath: 'assets/icons/headphone.svg',
                label: 'تواصل معنا',
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/share.svg',
                label: 'مشاركة التطبيق',
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/language-square.svg',
                label: 'تغيير اللغه',
                trallingWidget: Text('EN', style: Styles.textStyle12),
              ),
            ],
          ),
          MoreOptionsGroup(
            children: [
              MoreOptionItem(
                iconPath: 'assets/icons/logout.svg',
                label: 'تسجيل الخروج',
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/delet_account.svg',
                label: 'حذف الحساب',
                labelStyle: Styles.textStyle16.copyWith(color: kErrorColor),
                iconBackgroundColor: kErrorColor.withOpacity(.2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
