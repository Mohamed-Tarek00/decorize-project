import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddPriceSection extends StatelessWidget {
  const AddPriceSection({super.key, required this.pricecontroller});

  final TextEditingController pricecontroller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      name: 'السعر',
      hintText: '',
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ريال',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      nameTextStyle: Styles.textStyle18,
      controller: pricecontroller,
    );
  }
}
