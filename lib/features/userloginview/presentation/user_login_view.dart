import 'package:decorize_project/features/userloginview/presentation/widgets/user_login_view_body.dart';
import 'package:flutter/material.dart';

class UserLoginView extends StatelessWidget {
  const UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: UserLoginViewBody());
  }
}
