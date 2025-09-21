import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeWorkerAppBar extends StatefulWidget {
  const CustomHomeWorkerAppBar({super.key});

  @override
  State<CustomHomeWorkerAppBar> createState() => _CustomHomeWorkerAppBarState();
}

class _CustomHomeWorkerAppBarState extends State<CustomHomeWorkerAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0.h, left: 12.h, right: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/usertestphoto.png',
            height: 50.h,
            width: 50.w,
          ),
          SizedBox(width: 10.h),
          Column(
            children: [
              Text('مرحبا بك !', style: Styles.textStyle16),
              Text('يوسف السيد', style: Styles.textStyle16),
            ],
          ),
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
                activeThumbColor: Colors.white, // لون الدائرة
                activeTrackColor: Colors.green, // خلفية الـ On
                inactiveThumbColor: Colors.white, // لون الدائرة لما يبقى Off
                inactiveTrackColor: Colors.grey, // خلفية الـ Off
              ),
            ],
          ),
        ],
      ),
    );
  }
}
