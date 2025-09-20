import 'package:decorize_project/features/user/ads/presentation/widgets/ad_item.dart';
import 'package:flutter/material.dart';

class AdsListView extends StatelessWidget {
  const AdsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AdItem();
      },
    );
  }
}
