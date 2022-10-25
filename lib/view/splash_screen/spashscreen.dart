import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';

import '../bottom_navigation_bar/navigation_screen.dart';
import '../home_screen/home_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  late Image image1;
  late SvgPicture image2;
  // late Text title;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset(
      'asset/images/namma swasthya logo m.png',
      width: 100,
      height: 100,
    );
    image2 = SvgPicture.asset('asset/icons/logo only.svg');

    Timer(Duration(seconds: 3), () {
      if (prefer.getString('id') == null) {
        Get.to(const PhoneNumberVerificationScreen());
      } else {
        Get.to(BottumNavBarScreen());
      }
    });
  }

  @override
  void didChangeDependencies() {
    precachePicture(image2.pictureProvider, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: image1,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Namma Swasthya',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
