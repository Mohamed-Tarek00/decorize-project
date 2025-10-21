import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocationSection extends StatefulWidget {
  const GetLocationSection({super.key});

  @override
  State<GetLocationSection> createState() => _GetLocationSectionState();
}

class _GetLocationSectionState extends State<GetLocationSection> {
  LatLng? selectedLocation;
  String? adress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          GestureDetector(
            onTap: () async {
              final result = await context.push<Map<String, dynamic>>(
                AppRouterNames.addLocationView,
              );
              selectedLocation = LatLng(
                result!['latitude'],
                result['longitude'],
              );
              adress = result['address'];
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 18.h,
                            width: 18.w,
                            color: kPrimaryColor,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'العنوان على الخريطة',
                            style: Styles.textStyle14.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 1.h, color: kPrimaryColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          selectedLocation == null
              ? SizedBox.shrink()
              : Column(
                  children: [
                    Container(
                      height: 150.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: kPrimaryColor.withOpacity(0.3),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: selectedLocation!,
                            zoom: 14,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('position'),
                              position: selectedLocation!,
                            ),
                          },
                          zoomControlsEnabled: false,
                          scrollGesturesEnabled: false,
                          rotateGesturesEnabled: false,
                          tiltGesturesEnabled: false,
                          myLocationButtonEnabled: false,
                          mapToolbarEnabled: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            adress ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle12.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                              color: const Color(0xFF1D1B20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
