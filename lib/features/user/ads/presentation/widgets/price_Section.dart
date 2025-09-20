import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/custom_information_widget.dart'
    show CustomInformationWidget;
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        Row(
          children: [
            Text(
              '300 ريال',
              style: Styles.textStyle16.copyWith(color: kPrimaryColor),
            ),
          ],
        ),
      ],
      iconPath: 'assets/icons/dollar-square.svg',
      title: 'سعر الخدمة',
    );
  }
}
