import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('الاسم',style: Styles.textStyle14,),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'ادخل اسمك',
          ),
        ),
      ],
    );
  }
}