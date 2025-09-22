import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custome_bottomsheet.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_request_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OrderCancelBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: context.pop,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xffBBBABA),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Center(child: SvgPicture.asset('assets/logo/cancel.svg')),
              SizedBox(height: 24.h),
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  "هل تريد إلغاء الطلب",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              JobRequestTextField(
                label: "سبب الإلغاء (اختياري)",
                maxLines: 3,
                customLabel: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("سبب الإلغاء", style: Styles.textStyle14),
                    Text("(اختياري)", style: Styles.textStyle14),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomWorkerButton(
                      height: 40.h,
                      width: double.infinity,
                      text: "تقديم الطلب",
                      textStyle: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      color: kErrorColor,
                      onTap: () {
                        Navigator.pop(context);
                        CustomBottomSheet.show(
                          context,
                          imagePath: 'assets/logo/cancel.svg',
                          mainText: 'تم إلغاء الطلب الخاص بك بنجاح',
                          bodyText:
                              'لقد تم إلغاء طلبك بنجاح. يمكنك الآن التقديم على طلبات جديدة في أي وقت. نشكرك على استخدامك للتطبيق ونتطلع إلى مساعدتك في المستقبل .',
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomWorkerButton(
                      color: Colors.transparent,
                      height: 40.h,
                      width: double.infinity,
                      text: "تراجع",
                      textStyle: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),
                      onTap: () => context.pop(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
