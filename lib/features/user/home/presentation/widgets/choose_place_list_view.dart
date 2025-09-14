import 'package:decorize_project/features/user/home/presentation/widgets/place_item.dart';
import 'package:decorize_project/features/user/home/presentation/widgets/place_model.dart';
import 'package:flutter/material.dart';

class ChoosePlaceListView extends StatefulWidget {
  const ChoosePlaceListView({super.key});

  @override
  State<ChoosePlaceListView> createState() => _ChoosePlaceListViewState();
}

class _ChoosePlaceListViewState extends State<ChoosePlaceListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: PlaceModel.places.length,
      itemBuilder: (context, index) {
        return PlaceItem(
          index: index,
          isSelectedIndex: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
    );
  }
}
