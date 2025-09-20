import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.index,
    this.onTap,
    required this.isSelectedIndex,
  });
  final int index;
  final void Function()? onTap;
  final bool isSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 4.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          width: 75.w,
          decoration: BoxDecoration(
            color: isSelectedIndex ? kPrimaryColor : Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 4.h),
              SvgPicture.asset(
                PlaceModel.places[index].placeImage,
                width: 40.w,
                height: 40.h,
                color: isSelectedIndex ? Colors.white : Colors.black,
              ),
              Text(
                PlaceModel.places[index].placeName,
                style: Styles.textStyle12.copyWith(
                  color: isSelectedIndex ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
