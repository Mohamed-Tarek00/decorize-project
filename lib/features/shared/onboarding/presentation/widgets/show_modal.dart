import 'package:decorize_project/core/router/app_router.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/widgets/client_worker_selection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class ShowModal extends StatefulWidget {
  final Position? position;

  const ShowModal({Key? key, required this.position}) : super(key: key);

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.h,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/close-circle.svg',
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
          Text('نوع المستخدم', style: Styles.textStyle20),
          SizedBox(height: 5.h),
          ClientWorkerSelection(
            onChoiceSelected: (index) {
              selectedIndex = index;
            },
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              final userType = selectedIndex == 0 ? 'client' : 'worker';
              context.go(
                AppRouterNames.RegisterView,
                extra: {'type': userType, 'position': widget.position},
              );
            },
            text: 'التالي'.tr(),
          ),
        ],
      ),
    );
  }
}
