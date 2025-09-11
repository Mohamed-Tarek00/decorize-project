import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWorkerAppBar extends StatefulWidget {
  const CustomWorkerAppBar({super.key});

  @override
  State<CustomWorkerAppBar> createState() => _CustomWorkerAppBarState();
}

class _CustomWorkerAppBarState extends State<CustomWorkerAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.h,
          child: Image.asset('assets/logo/mainlogo.png'),
        ),
        SizedBox(width: 8.w),

        Text('مرحبا بك !\nيوسف السيد', style: Styles.textStyle16),
        Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isAvailable ? "متاح" : "غير متاح",
              style: TextStyle(
                fontSize: 16,
                color: isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8.w),
            Switch(
              value: isAvailable,
              onChanged: (value) {
                setState(() {
                  isAvailable = value;
                });
              },
              activeColor: Colors.white, // لون الدائرة
              activeTrackColor: Colors.green, // خلفية الـ On
              inactiveThumbColor: Colors.white, // لون الدائرة لما يبقى Off
              inactiveTrackColor: Colors.grey, // خلفية الـ Off
            ),
          ],
        ),
      ],
    );
  }
}
