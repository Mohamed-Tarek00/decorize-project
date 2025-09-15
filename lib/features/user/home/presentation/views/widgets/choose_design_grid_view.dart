import 'package:decorize_project/features/user/home/presentation/views/widgets/design_item.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/design_place_model.dart';
import 'package:flutter/material.dart';

class ChooseDesignGridView extends StatelessWidget {
  const ChooseDesignGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 2,
        childAspectRatio: 1.1,
      ),
      itemCount: DesignPlaceModel.designs.length,
      itemBuilder: (context, index) {
        return DesignItem(index: index);
      },
    );
  }
}
