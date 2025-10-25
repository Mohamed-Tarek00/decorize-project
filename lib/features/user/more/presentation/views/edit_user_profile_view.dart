import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_profile/edit_user_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditUserProfileView extends StatelessWidget {
  const EditUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: EditUserProfileViewBody(),
      bottomNavigationBar: CustomButton(onPressed: () {}, text: 'التعديل'),
    );
  }
}
