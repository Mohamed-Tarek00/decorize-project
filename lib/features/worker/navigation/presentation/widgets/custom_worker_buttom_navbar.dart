import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/worker_home_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_more_view.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/my_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWorkerBottomNavBar extends StatefulWidget {
  const CustomWorkerBottomNavBar({super.key});

  @override
  State<CustomWorkerBottomNavBar> createState() =>
      _CustomWorkerBottomNavBarState();
}

class _CustomWorkerBottomNavBarState extends State<CustomWorkerBottomNavBar> {
  int currentIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const WorkerHomeView(),
      MyOrdersView(
        onBackToHome: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
      Text('chat'),
      WorkerMoreView(
        onBackToHome: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Styles.textStyle14,
        unselectedLabelStyle: Styles.textStyle14,
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.house),
            activeIcon: const Icon(
              FontAwesomeIcons.house,
              color: kPrimaryColor,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/orders.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/orders.svg',
              color: kPrimaryColor,
            ),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/messages.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/messages.svg',
              color: kPrimaryColor,
            ),
            label: 'الرسائل',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/more.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/more.svg',
              color: kPrimaryColor,
            ),
            label: 'المزيد',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
