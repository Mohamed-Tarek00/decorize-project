import 'package:decorize_project/features/user/ads/presentation/widgets/sided_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationAdDetailsButtons extends StatefulWidget {
  const NavigationAdDetailsButtons({super.key});

  @override
  State<NavigationAdDetailsButtons> createState() =>
      _NavigationAdDetailsButtonsState();
}

class _NavigationAdDetailsButtonsState
    extends State<NavigationAdDetailsButtons> {
  bool IsRightButtonSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SidedRoundedButton(
          headingText: 'تفاصيل الاعلان',
          isRight: true,
          isSelected: IsRightButtonSelected,
          onTap: () {
            setState(() {
              IsRightButtonSelected = true;
            });
          },
        ),
        Container(height: 45.h, width: 1, color: Colors.grey.shade200),
        SidedRoundedButton(
          headingText: 'العروض المقدمة',
          isRight: false,
          isSelected: !IsRightButtonSelected,
          onTap: () {
            setState(() {
              IsRightButtonSelected = false;
            });
          },
        ),
      ],
    );
  }
}
