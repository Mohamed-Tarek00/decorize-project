import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(title, style: Styles.textStyle16),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: Styles.textStyle14.copyWith(color: Colors.grey.shade600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),

      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),

          CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            headingText: 'الشروط والاحكام',
          ),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("قبول الشروط"),
                  _buildSectionText(
                    "باستخدام التطبيق، فإنك توافق على هذه الشروط. إذا لم توافق، يرجى عدم استخدام التطبيق.",
                  ),

                  _buildSectionTitle("المستخدمون"),
                  _buildSectionText(
                    "يجب أن تكون قد بلغت من العمر 18 عامًا لتتمكن من استخدام التطبيق.",
                  ),

                  _buildSectionTitle("الاستخدام المسموح به"),
                  _buildSectionText(
                    "• استخدام التطبيق فقط للأغراض القانونية.\n"
                    "• عدم استخدام التطبيق لأي نشاط غير قانوني أو ضار.",
                  ),

                  _buildSectionTitle("المسؤولية"),
                  _buildSectionText(
                    "نحن غير مسؤولين عن أي أضرار ناتجة عن استخدام التطبيق.",
                  ),

                  _buildSectionTitle("التعديلات"),
                  _buildSectionText(
                    "نحتفظ بالحق في تعديل هذه الشروط في أي وقت. ستكون التغييرات سارية عند نشرها في التطبيق.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
