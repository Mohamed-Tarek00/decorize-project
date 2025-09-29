import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/widgets/more_option_group.dart';
import 'package:decorize_project/core/widgets/more_option_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserMoreSecondSection extends StatelessWidget {
  const UserMoreSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MoreOptionsGroup(
      children: [
        MoreOptionItem(
          iconPath: 'assets/icons/save.svg',
          label: 'التصميمات المحفوظه',
          onTap: () {
            context.push(AppRouterNames.savedDesignsView);
          },
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
    );
  }
}
