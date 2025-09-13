import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place_list_view.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/custom_user_app_bar.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/designplace_model.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/pick_multiple_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomUserAppBar(),
        SizedBox(height: 12.h),
        PickMultipleImages(),
        SizedBox(height: 12.h),
        ChoosePlace(),
        Text(
          'اختار التصميم',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 290.h,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 4,
                childAspectRatio: 1.2,
              ),
              itemCount: DesignPlaceModel.designs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            DesignPlaceModel.designs[index].designImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      DesignPlaceModel.designs[index].designName,
                      style: Styles.textStyle12,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
