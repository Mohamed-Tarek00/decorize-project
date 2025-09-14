import 'package:decorize_project/features/user/home/presentation/views/user_home_view.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/custom_buttom_nav_bar.dart';
import 'package:flutter/material.dart';

class UserNavigationBar extends StatefulWidget {
  const UserNavigationBar({super.key});

  @override
  State<UserNavigationBar> createState() => _UserNavigationBarState();
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  int currentIndex = 0;
  final List<Widget> _screens = const [
    UserHomeView(),
    Center(child: Text("طلباتي")),
    Center(child: Text("العمال")),
    Center(child: Text("المزيد")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: CustomButtomNavBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
