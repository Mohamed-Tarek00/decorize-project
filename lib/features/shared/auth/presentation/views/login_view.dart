import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/login_usecase.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.role, required this.position});
  final String? role;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUsecase>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kScaffoldColor,
          body: LoginViewBody(role: role, position: position),
        ),
      ),
    );
  }
}
