import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/shared/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/worker_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkerHomeView extends StatelessWidget {
  const WorkerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return WorkerHomeViewBody(user: state.response);
          } else {
            return const Center(child: Text('حدث خطأ'));
          }
        },
      ),
    );
  }
}
