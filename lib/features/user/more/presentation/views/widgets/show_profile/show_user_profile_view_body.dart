import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/change_picture_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowUserProfileViewBody extends StatefulWidget {
  const ShowUserProfileViewBody({super.key});
  static _EditUserProfileViewBodyState? of(BuildContext context) {
    return context.findAncestorStateOfType<_EditUserProfileViewBodyState>();
  }

  @override
  State<ShowUserProfileViewBody> createState() =>
      _EditUserProfileViewBodyState();
}

class _EditUserProfileViewBodyState extends State<ShowUserProfileViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> loadUserProfile() async {
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
    // TODO: implement initState
    super.initState();
    loadUserProfile();
  }

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
