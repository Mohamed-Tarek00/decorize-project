

import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_state.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EnterLocationSection extends StatelessWidget {
  const EnterLocationSection({super.key, this.selectedLocation});
  final LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, state) {
                            if (state is LocationLoading) {
                              return Padding(
                                padding: EdgeInsets.all(12),
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );
                            } else if (state is LocationLoaded) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/location.svg',
                                      width: 24.w,
                                      height: 24.h,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        state.location.displayName,
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
                              );
                            } else if (state is LocationError) {
                              return Padding(
                                padding: EdgeInsets.all(12.r),
                                child: Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        CustomButton(
                          onPressed: () {
                            print('Selected Location: $selectedLocation');
                          },
                          text: 'أضف الموقع',
                        ),
                      ],
                    ),
                  ),
                );
  }
}