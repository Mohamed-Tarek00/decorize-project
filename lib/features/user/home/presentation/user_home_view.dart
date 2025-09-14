import 'package:decorize_project/features/user/home/presentation/widgets/user_home_view_body.dart';
import 'package:flutter/material.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: UserHomeViewBody(),
    );
  }
}
