import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/more_option_group.dart';
import 'package:decorize_project/core/widgets/more_option_item.dart';
import 'package:flutter/material.dart';

class UserMoreThirdSection extends StatelessWidget {
  const UserMoreThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MoreOptionsGroup(
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
    );
  }
}
