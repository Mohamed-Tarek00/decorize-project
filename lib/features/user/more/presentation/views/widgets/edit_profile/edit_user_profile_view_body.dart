import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_profile/change_picture_section.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_profile/editing_data_section.dart';
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
    final _cacheHelper = await getIt<CacheHelper>();
    final _cacheUser = await _cacheHelper.getUserProfile();
    if (_cacheUser != null) {
      setState(() {
        nameController.text = _cacheUser.name;
        phoneController.text = _cacheUser.phone;
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
