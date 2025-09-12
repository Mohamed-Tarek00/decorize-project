import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChoosePlace extends StatelessWidget {
  const ChoosePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, top: 12.h, bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'اختر المكان',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 75.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PlaceModel.places.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 4.h,
                    ),
                    height: 75.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          PlaceModel.places[index].placeImage,
                          color: Colors.black,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          PlaceModel.places[index].placeName,
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
