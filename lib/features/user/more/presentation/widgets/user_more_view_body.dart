import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/edit_user_profile_section.dart';
import 'package:decorize_project/core/widgets/more_option_group.dart';
import 'package:decorize_project/core/widgets/more_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMoreViewBody extends StatelessWidget {
  const UserMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(onTap: () {}, headingText: 'المزيد'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                EditUserProfileSection(),
                MoreOptionsGroup(
                  children: [
                    MoreOptionItem(
                      iconPath: 'assets/icons/save.svg',
                      label: 'التصميمات المحفوظه',
                    ),
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
                      labelStyle: Styles.textStyle16.copyWith(
                        color: kErrorColor,
                      ),
                      iconBackgroundColor: kErrorColor.withOpacity(.2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
