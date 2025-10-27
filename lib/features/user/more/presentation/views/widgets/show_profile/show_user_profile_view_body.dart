import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/change_picture_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowUserProfileViewBody extends StatelessWidget {
  const ShowUserProfileViewBody({super.key, required this.nameController, required this.phoneController});

 final   TextEditingController nameController;
  final TextEditingController phoneController ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            headingText: 'الملف الشخصي',
          ),
          SizedBox(height: 10.h),
          ChangePictureSection(),
          SizedBox(height: 10.h),
          Text(nameController.text, style: Styles.textStyle18),
          DataSection(
            nameController: nameController,
            phoneController: phoneController,
          ),
        ],
      ),
    );
  }
}
