import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/design_place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignItem extends StatelessWidget {
  const DesignItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(DesignPlaceModel.designs[index].designImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          DesignPlaceModel.designs[index].designName,
          style: Styles.textStyle12,
        ),
      ],
    );
  }
}
