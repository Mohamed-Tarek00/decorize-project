import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/choose_place_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePlace extends StatefulWidget {
  const ChoosePlace({super.key});

  @override
  State<ChoosePlace> createState() => _ChoosePlaceState();
}

class _ChoosePlaceState extends State<ChoosePlace> {
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
          SizedBox(height: 84.h, child: ChoosePlaceListView()),
        ],
      ),
    );
  }
}
