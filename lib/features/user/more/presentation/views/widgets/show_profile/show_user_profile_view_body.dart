import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/change_picture_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/editing_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowUserProfileBody extends StatefulWidget {
  const ShowUserProfileBody({super.key});

  @override
  State<ShowUserProfileBody> createState() => _EditUserProfileViewBodyState();
}

class _EditUserProfileViewBodyState extends State<ShowUserProfileBody> {
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
    // TODO: implement initState
    super.initState();
    _loadUserData();
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
          EditingDataSection(
            nameController: nameController,
            phoneController: phoneController,
          ),
        ],
      ),
    );
  }
}
