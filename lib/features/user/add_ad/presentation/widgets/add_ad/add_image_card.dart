import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddImageCard extends StatelessWidget {
  const AddImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: EdgeInsets.all(8.sp),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.grey.shade300),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/add_photo.svg'),
                ),
              );
  }
}