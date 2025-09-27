import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_photos_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_price_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/class_room_dropdown.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdViewBody extends StatefulWidget {
  const AddAdViewBody({super.key});

  @override
  State<AddAdViewBody> createState() => _AddAdViewBodyState();
}

class _AddAdViewBodyState extends State<AddAdViewBody> {
  final TextEditingController desccontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),

        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'إنشاء اعلان',
        ),
        Container(width: double.infinity, height: 20.h, color: Colors.white),
        SizedBox(height: 10.h),
        ClassRoomDropdown(),
        SizedBox(height: 10.h),
        CustomTextFormField(
          name: 'اسم الإعلان',
          hintText: '',
          nameTextStyle: Styles.textStyle18,
          controller: desccontroller,
        ),
        SizedBox(height: 5.h),
        AddPriceSection(pricecontroller: pricecontroller),
        SizedBox(height: 5.h),

        AddPhotosSection(),
      ],
    );
  }
}
