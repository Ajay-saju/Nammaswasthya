import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/core/colors.dart';
import '../core/constent_size.dart';
import '../home_screen/home_screen.dart';

class MoreOptionScreen extends StatelessWidget {
  const MoreOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          h2,
          // Row(children: [
          //   Text('Biometric Authentication'),Spacer(),

          // ],),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                prefer.remove('id');
                Get.off(PhoneNumberVerificationScreen());
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
          )
        ],
      )),
    );
  }
}
