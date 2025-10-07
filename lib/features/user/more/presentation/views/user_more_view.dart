import 'package:decorize_project/features/user/more/presentation/views/widgets/user_more/user_more_view_body.dart';
import 'package:flutter/material.dart';

class UserMoreView extends StatelessWidget {
  const UserMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),

      body: UserMoreViewBody(),
    );
  }
}
