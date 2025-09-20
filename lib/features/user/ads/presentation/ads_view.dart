import 'package:decorize_project/features/user/ads/presentation/widgets/ads_view_body.dart';
import 'package:flutter/material.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffF2F2F2), body: AdsViewBody());
  }
}
