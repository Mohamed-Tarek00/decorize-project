import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:decorize_project/core/utils/styles.dart';

class MoreOptionItem extends StatelessWidget {
  const MoreOptionItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.trallingWidget,
    this.labelStyle,
    this.iconBackgroundColor,
  });
  final Color? iconBackgroundColor;
  final TextStyle? labelStyle;
  final String iconPath;
  final String label;
  final VoidCallback? onTap;
  final Widget? trallingWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: iconBackgroundColor ?? const Color(0xffE9E9E9),
              child: SvgPicture.asset(iconPath),
            ),
            SizedBox(width: 8.w),
            Text(label, style: labelStyle ?? Styles.textStyle16),
            Spacer(),
            trallingWidget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
