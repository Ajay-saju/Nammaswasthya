import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/core/colors.dart';
import '../core/constent_size.dart';
import '../home_screen/home_screen.dart';
import '../otp_verification_screen/otp_verification_controller.dart';

class MoreOptionScreen extends StatefulWidget {
  MoreOptionScreen({super.key});

  @override
  State<MoreOptionScreen> createState() => _MoreOptionScreenState();
}

class _MoreOptionScreenState extends State<MoreOptionScreen> {
// final moreOptController=Get.put(MoreOptController);
  var bio = prefer.getBool('bio');
    // OtpVerificationController  controller =Get.find ();
// var bio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          h2,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                // controller.isStopTimer.value = true;
                prefer.remove('name');
                prefer.remove('id');
                Get.to(PhoneNumberVerificationScreen());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: appColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          h1,
          // Padding(
          //   padding: const EdgeInsets.only(right: 20, left: 50),
          //   child: SwitchListTile(
          //       title: Text(
          //         bio == false ? 'TurnOn app lock' : "TurnOff app lock",
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //       value: bio!,
          //       onChanged: (bool value) async {
          //         setState(() {
          //           bio = value;
          //           prefer.setBool('bio', bio!);
          //           print(prefer.getBool('bio').toString());
          //         });
          //       }),
          // ),
        ],
      )),
    );
  }
}
