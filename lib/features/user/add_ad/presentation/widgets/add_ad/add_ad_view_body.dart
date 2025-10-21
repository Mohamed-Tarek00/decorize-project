import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/add_ad_info_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/add_photos_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/add_price_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/class_room_dropdown.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/get_location_section.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
