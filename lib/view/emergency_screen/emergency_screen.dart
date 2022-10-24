import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/core/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constent_size.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Call For Emergency',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            h2,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ambulance',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "+911234567890",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            h1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Police',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "100",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            h1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber('911');
                    },
                    child: Text(
                      "911",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            h1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fireforce',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber('101');
                      
                    },
                    child: Text(
                      "101",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
