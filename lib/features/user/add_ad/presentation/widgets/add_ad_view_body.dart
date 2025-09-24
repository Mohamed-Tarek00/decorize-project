import 'package:decorize_project/features/user/ads/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdViewBody extends StatelessWidget {
  const AddAdViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),

        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'إنشاء اعلان',
        ),
        Container(width: double.infinity, height: 20.h, color: Colors.white),
      ],
    );
  }
}
