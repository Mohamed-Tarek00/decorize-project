import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/governorate_cubit/cubit/governorate_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decorize_project/features/authantication/presentation/widgets/user__register_view_body.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatelessWidget {
  const UserRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return GovernorateCubit(getIt<GetGovernoratesUseCase>())
          ..fetchGovernorates();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: const UserRegisterViewBody(),
      ),
    );
  }
}
