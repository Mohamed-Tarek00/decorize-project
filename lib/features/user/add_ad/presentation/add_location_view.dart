import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_location_view_body.dart';
import 'package:flutter/material.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: AddLocationViewBody(),
    );
  }
}
