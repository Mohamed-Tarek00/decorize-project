import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/widgets/job_details_widgets/job_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.job});
  final WorkerJobEntity job;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LocationCubit>(),
      child: Scaffold(
        backgroundColor: kScaffoldColor,
        body: JobDetailsViewBody(job: job),
      ),
    );
  }
}
