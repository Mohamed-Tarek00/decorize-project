import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_loading_indicator.dart';
import 'package:decorize_project/features/user/more/presentation/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_profile/edit_user_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditUserProfileView extends StatefulWidget {
  const EditUserProfileView({super.key});

  @override
  State<EditUserProfileView> createState() => _EditUserProfileViewState();
}

class _EditUserProfileViewState extends State<EditUserProfileView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _loadUserData() async {
    final cacheHelper = getIt<CacheHelper>();
    final cacheUser = await cacheHelper.getUserProfile();
    if (cacheUser != null) {
      nameController.text = cacheUser.name;
      phoneController.text = cacheUser.phone;
    }
  }

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileCubit>(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم تحديث الملف الشخصي بنجاح ✅'),
                backgroundColor: Colors.green,
              ),
            );
            if (context.mounted) {
              context.pop(true);
            }
          } else if (state is EditProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kScaffoldColor,
            body: AbsorbPointer(
              absorbing: state is EditProfileLoading,
              child: EditUserProfileViewBody(
                nameController: nameController,
                phoneController: phoneController,
                formKey: _formKey,
              ),
            ),
            bottomNavigationBar: Container(
              height: 80.h,
              color: Colors.white,
              child: Center(
                child: state is EditProfileLoading
                    ? const AbsorbPointer(child: CustomLoadingIndicator())
                    : CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<EditProfileCubit>().editProfile(
                              name: nameController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        text: 'التعديل',
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
