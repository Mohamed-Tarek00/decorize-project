import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/governorate_cubit/cubit/governorate_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/governorate_cubit/cubit/governorate_cubit_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GovernorateDropdown extends StatefulWidget {
  final Governorate? selectedGovernorate;
  final ValueChanged<Governorate?> onChanged;

  const GovernorateDropdown({
    Key? key,
    required this.selectedGovernorate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _GovernorateDropdownState createState() => _GovernorateDropdownState();
}

class _GovernorateDropdownState extends State<GovernorateDropdown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernorateCubit, GovernorateState>(
      builder: (context, state) {
        List<Governorate> governorates = [];
        Widget dropdownWidget = SizedBox();

        if (state is GovernorateLoading) {
          dropdownWidget = CircularProgressIndicator();
        } else if (state is GovernorateLoaded) {
          governorates = state.governorates;
          dropdownWidget = DropdownButton<Governorate>(
            hint: Text('اختر المحافظة'),
            value: widget.selectedGovernorate,
            isExpanded: true,
            items: governorates.map((gov) {
              return DropdownMenuItem<Governorate>(
                value: gov,
                child: Text(gov.nameAr),
              );
            }).toList(),
            onChanged: widget.onChanged,
          );
        } else if (state is GovernorateError) {
          dropdownWidget = Text('حدث خطأ: ${state.message}');
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: dropdownWidget,
        );
      },
    );
  }
}
