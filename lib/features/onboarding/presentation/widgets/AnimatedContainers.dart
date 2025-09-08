import 'package:flutter/material.dart';

class AnimatedContainers extends StatelessWidget {
  const AnimatedContainers({
    super.key,
    required this.onBoardingItems,
    required this.currentPageIndex,
  });

  final List<Widget> onBoardingItems;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onBoardingItems.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentPageIndex == index ? 24 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentPageIndex == index ? Color(0xff0C5137) : Colors.grey,
            borderRadius: BorderRadius.circular(
              currentPageIndex == index ? 6 : 20,
            ),
          ),
        );
      }),
    );
  }
}
