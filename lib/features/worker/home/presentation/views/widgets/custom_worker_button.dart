import 'package:decorize_project/core/constants.dart';
import 'package:flutter/material.dart';

class CustomWorkerButton extends StatelessWidget {
  const CustomWorkerButton({
    super.key,
    this.height = 20,
    this.width = 20,
    this.color = kPrimaryColor,

    this.onTap,
    required this.text,
    required this.textStyle,
  });
  final TextStyle textStyle;
  final String text;
  final double height;
  final double width;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color == Colors.transparent
                ? kPrimaryColor
                : Colors.transparent,
          ),
          color: color,
        ),
        child: Center(child: Text(text, style: textStyle)),
      ),
    );
  }
}
