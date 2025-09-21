import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderCardList extends StatefulWidget {
  const OrderCardList({super.key});

  @override
  State<OrderCardList> createState() => _OrderCardListState();
}

class _OrderCardListState extends State<OrderCardList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: OrderCard(
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = null;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
