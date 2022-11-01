import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/splash_screen/spashscreen.dart';

late SharedPreferences prefer;


void main() async {
  Future.delayed(Duration(milliseconds: 5), () async {
    WidgetsFlutterBinding.ensureInitialized();
    prefer = await SharedPreferences.getInstance();

    runApp(const MyApp());

    
    
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    prefer.setBool('bio', false);
    
    precacheImage(
        Image(image: AssetImage('asset/images/namma swasthya logo m.png'))
            .image,
        context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpalshScreen(),
      // home: login == null || login.isEmpty
      //     ? SpalshScreen()
      //     : BottumNavBarScreen()
    );
  }
}
