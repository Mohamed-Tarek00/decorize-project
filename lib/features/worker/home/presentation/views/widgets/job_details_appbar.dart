import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailsAppBar extends StatefulWidget {
  const JobDetailsAppBar({super.key});

  @override
  State<JobDetailsAppBar> createState() => _JobDetailsAppBarState();
}

class _JobDetailsAppBarState extends State<JobDetailsAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 46.0.h,
        left: 12.h,
        right: 12.h,
        bottom: 32.h,
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back_ios, size: 20),
          Expanded(
            child: Center(
              child: Text('تفاصيل الإعلان', style: Styles.textStyle16),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
