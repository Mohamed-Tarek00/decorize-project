import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/more/presentation/widgets/contact_us/contact_us_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: ContactUsViewBody(),
      bottomNavigationBar: Container(
        height: 80.h,
        color: Colors.white,
        child: Center(
          child: CustomButton(onPressed: () {}, text: 'إرسال'),
        ),
      ),
    );
  }
}
