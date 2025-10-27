import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePictureSection extends StatelessWidget {
  const ChangePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: AssetImage('assets/design/worker_profile.png'),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.grey.shade200,
            child: SvgPicture.asset(
              'assets/icons/edit.svg',
              width: 20.w,
              height: 20.h,
              color: Color(0xff9D5C0D),
            ),
          ),
        ),
      ],
    );
  }
}
