import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/location_remote_data_source_Impl.dart';
import 'package:decorize_project/features/authantication/data/models/location_repository_impl.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/governorate_cubit/cubit/governorate_cubit_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decorize_project/features/authantication/presentation/widgets/user__register_view_body.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatelessWidget {
  const UserRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final dio = Dio();
        final apiService = ApiService(dio);
        final remoteDataSource = LocationRemoteDataSourceImpl(apiService);
        final locationRepository = LocationRepositoryImpl(remoteDataSource);
        final getGovernoratesUseCase = GetGovernoratesUseCase(
          locationRepository,
        );
        return GovernorateCubit(getGovernoratesUseCase)..fetchGovernorates();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: const UserRegisterViewBody(),
      ),
    );
  }
}
