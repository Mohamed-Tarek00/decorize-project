import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_cities_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_jobs_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/city_cubit/cubit/city_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/governorate_cubit/cubit/governorate_cubit_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/job_cubit/job_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/register_request_cubit/cubit/register_request_cubit_.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key, required this.role, this.position});
  final String role;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return GovernorateCubit(getIt<GetGovernoratesUseCase>())
              ..fetchGovernorates();
          },
        ),
        BlocProvider(
          create: (_) {
            return JobCubit(getIt<GetJobsUseCase>())..fetchJobs();
          },
        ),

        BlocProvider(create: (context) => CityCubit(getIt<GetCitiesUseCase>())),
        BlocProvider(
          create: (context) => RegisterCubit(getIt<RegisterUseCase>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: RegisterViewBody(role: role, position: position),
      ),
    );
  }
}
