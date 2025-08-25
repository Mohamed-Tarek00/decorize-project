import 'package:decorize_project/features/userregisterview/presentation/widgets/user__register_view_body.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatelessWidget {
  const UserRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: UserRegisterViewBody(),
    );
  }
}
