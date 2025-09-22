import 'package:decorize_project/features/user/ads/presentation/widgets/sided_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationAdDetailsButtons extends StatelessWidget {
  const NavigationAdDetailsButtons({
    super.key,
    required this.LeftButtonSelected,
    required this.RightButtonSelected,
    required this.rightButtonSelected,
  });
  final void Function()? LeftButtonSelected;
  final void Function()? RightButtonSelected;
  final bool rightButtonSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: RightButtonSelected,
          child: SidedRoundedButton(
            headingText: 'تفاصيل الاعلان',
            isRight: true,
            isSelected: rightButtonSelected,
          ),
        ),
        Container(height: 45.h, width: 1, color: Colors.grey.shade200),
        GestureDetector(
          onTap: LeftButtonSelected,
          child: SidedRoundedButton(
            headingText: 'العروض المقدمة',
            isRight: false,
            isSelected: !rightButtonSelected,
          ),
        ),
      ],
    );
  }
}
