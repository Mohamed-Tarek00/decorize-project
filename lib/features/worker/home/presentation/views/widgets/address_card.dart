import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                'العنوان',
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Divider(),
          SizedBox(height: 4.h),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              'assets/home_images/image 16.png',
              width: double.infinity,
              height: 125.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'المنطقة , المدينه , الحي\n64 شارع وادي الجيج , مقابل مطعم ومشويات نافورة حماه, الخُبر ,  الحي 64 شارع وادي الجيج, مقابل مطعم ومشويات نافورة حماه, الخُبر',
                    style: Styles.textStyle12.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
