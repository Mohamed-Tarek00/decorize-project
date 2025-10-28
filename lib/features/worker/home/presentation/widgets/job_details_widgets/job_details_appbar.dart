import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class JobDetailsAppBar extends StatelessWidget {
  const JobDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 32.0.h,
        left: 12.h,
        right: 12.h,
        bottom: 16.h,
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
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20),
          ),
          Expanded(
            child: Center(
              child: Text('تفاصيل الإعلان', style: Styles.textStyle16),
            ),
          ),
          Opacity(
            opacity: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
