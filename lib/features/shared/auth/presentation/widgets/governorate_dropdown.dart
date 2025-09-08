import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/governorate_cubit/cubit/governorate_cubit_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/governorate_cubit/cubit/governorate_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernorateDropdown extends StatelessWidget {
  final Governorate? selectedGovernorate;
  final ValueChanged<Governorate?> onChanged;

  const GovernorateDropdown({
    super.key,
    required this.selectedGovernorate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المحافظة', style: Styles.textStyle14),
          SizedBox(height: 8.h),
          Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: BlocBuilder<GovernorateCubit, GovernorateState>(
              builder: (context, state) {
                if (state is GovernorateLoading) {
                  return Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is GovernorateLoaded) {
                  final governorates = state.governorates;

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
                          child: DropdownButton<Governorate>(
                            hint: Text(
                              'اختر المحافظة',
                              style: Styles.textStyle14,
                            ),
                            value: selectedGovernorate,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: governorates.map((gov) {
                              return DropdownMenuItem<Governorate>(
                                value: gov,
                                child: Text(
                                  gov.nameAr,
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
                } else if (state is GovernorateError) {
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
