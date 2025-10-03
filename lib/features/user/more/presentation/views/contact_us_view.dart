import 'package:decorize_project/features/user/more/presentation/widgets/contact_us_view_body.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: ContactUsViewBody(),
    );
  }
}
