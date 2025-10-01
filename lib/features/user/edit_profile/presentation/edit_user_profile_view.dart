import 'package:decorize_project/features/user/edit_profile/presentation/widgets/edit_user_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditUserProfileView extends StatelessWidget {
  const EditUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffF2F2F2),body:EditUserProfileViewBody() ,);
  }
}