import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WorkerProfileCard extends StatelessWidget {
  const WorkerProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset('assets/design/worker_profile.png'),
        title: Text('بلال محمود', style: Styles.textStyle16),
        subtitle: Row(
          children: [
            Icon(Icons.star, color: Color(0xffFFD012)),
            SizedBox(width: 4.w),
            Text(
              '4.9',
              style: Styles.textStyle14.copyWith(color: Color(0xff67675C)),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () => context.push(AppRouterNames.workerProfileView),
          child: CircleAvatar(
            backgroundColor: Color(0xffE7EEEB),
            radius: 25,
            child: SvgPicture.asset('assets/icons/edit.svg'),
          ),
        ),
      ),
    );
  }
}
