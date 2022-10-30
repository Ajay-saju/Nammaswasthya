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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              h2,
              Text(
                'Namma Swasthya Emergency',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('+919620402211');
                  },
                  child: Text(
                    "+919620402211",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Text(
                "Women's Helpline",
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Row(
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
                  Text(
                    ',',
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
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
                      ))
                ],
              ),
              Text(
                'Senior Citizens Helpline',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('1090');
                  },
                  child: Text(
                    "1090",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Text(
                "Children's Helpline",
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('1098');
                  },
                  child: Text(
                    "1098",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Text(
                'Ambulance',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Row(
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
                  Text(
                    ',',
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
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
              ),
              Text(
                'Fireforce',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('080-22971500');
                      },
                      child: Text(
                        "080-22971500",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Text(
                    ',',
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber('101');
                      },
                      child: Text(
                        "101",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Text(
                'Police',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('100');
                  },
                  child: Text(
                    "100                       ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              h1,
              Text(
                'Emergency',
                style: TextStyle(
                    color: appColor, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('911');
                  },
                  child: Text(
                    "911                       ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              h1,
            ],
          ),
        ),
      ),
    );
  }
}
