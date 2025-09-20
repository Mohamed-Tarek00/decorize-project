import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_details_view_body.dart';
import 'package:flutter/material.dart';

class AdDetailsView extends StatelessWidget {
  const AdDetailsView({super.key, required this.ad});
  final AdModel ad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: AdDetailsViewBody(ad: ad),
    );
  }
}
