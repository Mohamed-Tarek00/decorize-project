import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/show_user_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShowUserProfile extends StatefulWidget {
  const ShowUserProfile({super.key});

  @override
  State<ShowUserProfile> createState() => _ShowUserProfileState();
}

class _ShowUserProfileState extends State<ShowUserProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> loadUserProfile() async {
    final cacheHelper = await getIt<CacheHelper>();
    final cacheUser = await cacheHelper.getUserProfile();
    if (cacheUser != null) {
      nameController.text = cacheUser.name;
      phoneController.text = cacheUser.phone;
    }
  }

  @override
  void initState() {
    loadUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: ShowUserProfileViewBody(
        nameController: nameController,
        phoneController: phoneController,
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        color: Colors.white,
        child: Center(
          child: CustomButton(
            onPressed: () async {
              final result = await context.push<bool>(
                AppRouterNames.editUserProfileView,
              );

              if (result == true) {
                await loadUserProfile();

              }
            },
            text: 'تعديل',
          ),
        ),
      ),
    );
  }
}
