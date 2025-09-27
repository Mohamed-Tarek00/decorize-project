import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad_info_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_photos_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_price_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/class_room_dropdown.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/get_location_section.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdViewBody extends StatefulWidget {
  const AddAdViewBody({super.key});

  @override
  State<AddAdViewBody> createState() => _AddAdViewBodyState();
}

class _AddAdViewBodyState extends State<AddAdViewBody> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),

          CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            headingText: 'إنشاء اعلان',
          ),
          Container(width: double.infinity, height: 20.h, color: Colors.white),
          ClassRoomDropdown(),
          AddAdInfoSection(
            titlecontroller: titlecontroller,
            desccontroller: desccontroller,
          ),
          AddPriceSection(pricecontroller: pricecontroller),

          AddPhotosSection(),
          GetLocationSection(),
          CustomButton(onPressed: () {}, text: 'إنشاء'),
        ],
      ),
    );
  }
}
