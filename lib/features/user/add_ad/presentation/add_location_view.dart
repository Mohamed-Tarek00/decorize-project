import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_Location/add_location_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: BlocProvider(
        create: (context) =>  getIt<LocationCubit>(),
        child: AddLocationViewBody(),
      ),
    );
  }
}
