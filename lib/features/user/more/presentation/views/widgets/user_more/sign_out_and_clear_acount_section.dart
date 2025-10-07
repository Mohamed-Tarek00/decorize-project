import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/more_option_group.dart';
import 'package:decorize_project/core/widgets/more_option_item.dart';
import 'package:flutter/material.dart';

class SignOutAndClearAcountSection extends StatelessWidget {
  const SignOutAndClearAcountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MoreOptionsGroup(
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
    );
  }
}
