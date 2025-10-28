import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/profile/domain/usecases/profile_usecase.dart';
import 'package:decorize_project/features/shared/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:decorize_project/features/worker/home/presentation/views/worker_home_view.dart';
import 'package:decorize_project/features/worker/more/presentation/view/worker_more_view.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/my_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CustomWorkerBottomNavBar extends StatefulWidget {
  const CustomWorkerBottomNavBar({super.key, this.position});
  final Position? position;

  @override
  State<CustomWorkerBottomNavBar> createState() =>
      _CustomWorkerBottomNavBarState();
}

class _CustomWorkerBottomNavBarState extends State<CustomWorkerBottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const WorkerHomeView(),
      MyOrdersView(onBackToHome: () => setState(() => currentIndex = 0)),
      const Center(child: Text('Chat')),
      WorkerMoreView(onBackToHome: () => setState(() => currentIndex = 0)),
    ];

    return BlocProvider(
      create: (context) =>
          ProfileCubit(getIt.get<ProfileUsecase>())..loadProfile(),

      child: Scaffold(
        body: IndexedStack(index: currentIndex, children: screens),
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
      ),
    );
  }
}
