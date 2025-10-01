import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/edit_profile/presentation/widgets/change_picture_section.dart';
import 'package:decorize_project/features/user/edit_profile/presentation/widgets/editing_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserProfileViewBody extends StatefulWidget {
  const EditUserProfileViewBody({super.key});

  @override
  State<EditUserProfileViewBody> createState() =>
      _EditUserProfileViewBodyState();
}

class _EditUserProfileViewBodyState extends State<EditUserProfileViewBody> {
  TextEditingController nameController = TextEditingController();

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
          Text('احمد محمد', style: Styles.textStyle18),
          EditingDataSection(),
        ],
      ),
    );
  }
}
