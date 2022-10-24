// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:swasthya/view/core/colors.dart';

import '../profile_screen/profile_screen_controller.dart';

class ViewFileScreen extends StatelessWidget {
  int index;
  ViewFileScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  ProfileScreenController fileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'View your file',
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
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(fileController
                      .getMedicalDetails.value.data![index].file
                      .toString())),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1.5, color: appColor)),
        ),
      ),
    );
  }
}
