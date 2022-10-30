import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/core/colors.dart';
import '../dashboard_screen/dashboard_controller.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../emergency_screen/emergency_screen.dart';
import '../more_option_screen/more_option_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'bottum_nav_controller.dart';


ValueNotifier<int> indexChaingeNotifier = ValueNotifier(0);
class BottumNavBarScreen extends StatefulWidget {
  BottumNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottumNavBarScreen> createState() => _BottumNavBarScreenState();
}

class _BottumNavBarScreenState extends State<BottumNavBarScreen> {

  @override
  void initState() {
    indexChaingeNotifier=ValueNotifier(0);
    super.initState();
  }
  
  final dashBordController = Get.put(DashBordController());

  final navigationController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    
    final screens = [
      DashBoardScreen(),
      EmergencyScreen(),
      ProfileScreen(),
      MoreOptionScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (navigationController.tabIndex != 0) {
          navigationController.tabIndex = 0;
          navigationController.update();
          return Future.value(false);
        } else {
          Get.defaultDialog(
              title: 'Are you sure',
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Back'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text('Exit'),
                        ),
                      ),
                    ],
                  )
                ],
              ));
        }
        return Future.value(false);
      },
      child: Scaffold(
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
      ),
    );
  }
}



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
            
            
            showSelectedLabels: false,
            showUnselectedLabels: false,
              // backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              // elevation: 0,
              selectedItemColor: appColor,
              unselectedItemColor: Colors.grey,
              currentIndex: newIndex,
              onTap: (index) {
                indexChaingeNotifier.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/home-svgrepo-com (3).svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/emergency-kit-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/user-profile-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/hamburger-menu-more-2-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    color: appColor,
                  ),
                  label: "",
                ),
              ]);
        });
  }
}
