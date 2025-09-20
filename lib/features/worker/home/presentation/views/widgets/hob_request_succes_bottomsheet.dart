import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class JobRequestSuccessBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/logo/success logo.svg'),
              SizedBox(height: 24.h),
              Text(
                "تم تقديم الطلب الخاص بك بنجاح",
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16.h),

              Text(
                "تم تقديم طلب الخدمة بنجاح. نحن في انتظار الرد من العميل. شكرًا لك على اهتمامك ومبادرتك لتقديم الخدمة!",
                textAlign: TextAlign.center,
                style: Styles.textStyle14.copyWith(color: Color(0xff4F4C4D)),
              ),
              SizedBox(height: 24.h),
              CustomWorkerButton(
                text: "عودة إلى القائمة الرئيسية",
                textStyle: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                height: 35.h,
                width: double.infinity,
                onTap: () => context.go(AppRouterNames.workerBottomNavigation),
              ),
            ],
          ),
        );
      },
    );
  }
}
