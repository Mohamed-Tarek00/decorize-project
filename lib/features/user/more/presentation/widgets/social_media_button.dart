import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: 12.r, bottom: 12.r, left: 12.r),
        child: Container(
          width: 40.h,
          height: 40.h,
          decoration: BoxDecoration(
            color: Color(0xffE7EEEB),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(child: FaIcon(icon, color: Colors.black)),
        ),
      ),
    );
  }
}
