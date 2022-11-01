import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/core/colors.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    TextButton(
                        onPressed: () {
                          FlutterPhoneDirectCaller.callNumber('+919620402211');
                        },
                        child: Text(
                          "+919620402211",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ],
                  title: Text(
                    'Namma Swathya Emergency',
                    style: TextStyle(
                        color: appColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
              h1,
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber(
                          '+1091',
                        );
                      },
                      child: Text(
                        "+1091",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber(
                          '+181',
                        );
                      },
                      child: Text(
                        '181',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
                title: Text(
                  "Women's Helpline",
                  style: TextStyle(
                      color: appColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('1090');
                      },
                      child: Text(
                        "1090",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
                title: Text(
                  'Senior Citizens Helpline',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('1098');
                      },
                      child: Text(
                        "1098",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
                title: Text(
                  "Children's Helpline",
                  style: TextStyle(
                      color: appColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('105711');
                      },
                      child: Text(
                        '105711',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('108');
                      },
                      child: Text(
                        "108",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
                title: Text(
                  'Ambulance',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('100');
                      },
                      child: Text(
                        "100                       ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('112');
                      },
                      child: Text(
                        "112                       ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
                title: Text(
                  'Police',
                  style: TextStyle(
                      color: appColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
