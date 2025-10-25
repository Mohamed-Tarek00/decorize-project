import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/edit_profile/edit_user_profile_view_body.dart';
import 'package:flutter/material.dart';

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
      setState(() {
        nameController.text = cacheUser.name;
        phoneController.text = cacheUser.phone;
      });
    }
  }

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: EditUserProfileViewBody(
        nameController: nameController,
        phoneController: phoneController,
        formKey: _formKey,
      ),
      bottomNavigationBar: CustomButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم حفظ البيانات مؤقتًا ✅'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        text: 'التعديل',
      ),
    );
  }
}
