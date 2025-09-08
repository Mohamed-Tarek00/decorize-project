import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/auth/domain/entities/city.dart';
import 'package:decorize_project/features/auth/presentation/cubits/city_cubit/cubit/city_cubit.dart';
import 'package:decorize_project/features/auth/presentation/cubits/city_cubit/cubit/city_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CityDropdown extends StatelessWidget {
  const CityDropdown({
    super.key,
    required this.onChanged,
    required this.selectedCity,
  });
  final City? selectedCity;
  final ValueChanged<City?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المدينة', style: Styles.textStyle14),
          SizedBox(height: 8.h),
          Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: BlocBuilder<CityCubit, CityState>(
              builder: (context, state) {
                if (state is CityLoading) {
                  return Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is CityLoaded) {
                  final cities = state.cities;

                  return Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        height: 27.h,
                        width: 27.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<City>(
                            hint: Text(
                              'اختر المدينة',
                              style: Styles.textStyle14,
                            ),
                            value: selectedCity,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: cities.map((city) {
                              return DropdownMenuItem<City>(
                                value: city,
                                child: Text(
                                  city.nameAr,
                                  style: Styles.textStyle14,
                                ),
                              );
                            }).toList(),
                            onChanged: onChanged,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is CityError) {
                  return Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Text(
                      'حدث خطأ: ${state.message}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
