import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swasthya/view/core/colors.dart';

import '../dashboard_screen/dashboard_controller.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../emergency_screen/emergency_screen.dart';
import '../more_option_screen/more_option_screen.dart';
import '../profile_screen/profile_screen.dart';

class BottumNavBarScreen extends StatelessWidget {


   BottumNavBarScreen({Key? key}) : super(key: key);

  final dashBordController = Get.put(DashBordController());

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashBoardScreen(),
      EmergencyScreen(),
      ProfileScreen(),
      MoreOptionScreen(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: indexChaingeNotifier,
              builder: (context, int index, _) {
                return screens[index];
              })
        ],
      ),
      bottomNavigationBar: MyBottumNavBar(),
    );
  }
}

ValueNotifier<int> indexChaingeNotifier = ValueNotifier(0);

class MyBottumNavBar extends StatelessWidget {
  const MyBottumNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChaingeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
            elevation: 0,
              // backgroundColor: Colors.blue,

              showUnselectedLabels: false,
              showSelectedLabels: true,
              selectedItemColor: Colors.black,
              currentIndex: newIndex,
              onTap: (index) {
                indexChaingeNotifier.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  // backgroundColor: Colors.blue,
                  icon: SvgPicture.asset(
                    'asset/icons/home-svgrepo-com (3).svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: 'Home',
                  //  tooltip: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/emergency-kit-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "Emergency",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/user-profile-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/hamburger-menu-more-2-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "More Options",
                ),
              ]);
        });
  }
}
