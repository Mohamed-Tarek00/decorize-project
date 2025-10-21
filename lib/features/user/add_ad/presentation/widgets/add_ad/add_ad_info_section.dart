import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAdInfoSection extends StatelessWidget {
  const AddAdInfoSection({
    super.key,
    required this.titlecontroller,
    required this.desccontroller,
  });

  final TextEditingController titlecontroller;
  final TextEditingController desccontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          name: 'اسم الإعلان',
          hintText: 'اختار اسم ملائم',
          nameTextStyle: Styles.textStyle18,
          controller: titlecontroller,
        ),
        CustomTextFormField(
          name: 'وصف الاعلان',
          hintText: 'صف الاعلان هنا',
          nameTextStyle: Styles.textStyle18,
          isDescription: true,
          controller: desccontroller,
        ),
      ],
    );
  }
}
