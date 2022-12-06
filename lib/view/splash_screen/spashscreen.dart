import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/splash_screen/spash_screen_controller.dart';
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
  final splashScreenController = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 5));

    image1 = Image.asset(
      'asset/images/namma swasthya logo m.png',
      width: 100,
      height: 100,
    );
    image2 = SvgPicture.asset('asset/icons/logo only.svg');

    // if(prefer.getBool('bio')==true)
    splashScreenController.authenticateUser();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    // precachePicture(image2.pictureProvider, context);

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
