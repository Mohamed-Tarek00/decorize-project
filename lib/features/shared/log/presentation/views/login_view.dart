import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/shared/log/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.role, required this.position});
  final String? role;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kScaffoldColor,
        body: LoginViewBody(role: role, position: position),
      ),
    );
  }
}
