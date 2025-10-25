import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/change_picture_section.dart';
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
  TextEditingController phoneController = TextEditingController();

  Future<void> _loadUserData() async {
    final cacheHelper = await getIt<CacheHelper>();
    final cacheUser = await cacheHelper.getUserProfile();
    if (cacheUser != null) {
      setState(() {
        nameController.text = cacheUser.name;
        phoneController.text = cacheUser.phone;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'تعديل الملف الشخصي',
        ),
        SizedBox(height: 10.h),
        ChangePictureSection(),
        Text(nameController.text, style: Styles.textStyle18),

        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.all(12.r),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: nameController,
                  name: 'الاسم',
                  hintText: 'الاسم',
                  iconPath: 'assets/icons/profile.svg',
                  height: 50.h,
                ),
                CustomTextFormField(
                  controller: phoneController,
                  name: 'رقم الجوال',
                  hintText: 'رقم الجوال',
                  iconPath: 'assets/icons/phone.svg',
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
