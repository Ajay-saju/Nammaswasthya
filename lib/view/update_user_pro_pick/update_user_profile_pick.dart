import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swasthya/view/bottom_navigation_bar/navigation_screen.dart';
import 'package:swasthya/view/update_user_pro_pick/update_profile_pick_controller.dart';

import '../core/colors.dart';
import '../core/constent_size.dart';


class UpdateUserProfilePictureScreen extends StatefulWidget {
  UpdateUserProfilePictureScreen({super.key});

  @override
  State<UpdateUserProfilePictureScreen> createState() =>
      _UpdateUserProfilePictureScreenState();
}

class _UpdateUserProfilePictureScreenState
    extends State<UpdateUserProfilePictureScreen> {
  final ImagePicker picker = ImagePicker();
  final pcontroller = Get.put(ProfilePickController());

  Image profileImage() {
    if (pcontroller.fileImage.value != '')
      return Image.file(File(pcontroller.fileImage.value));

    if (pcontroller.image() != '')
      return Image.network(pcontroller.image());
    else
      return Image.asset('asset/images/profile.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Update Profile Picture',
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
      body: SafeArea(
        child: Column(children: [
          h2,
          // Obx(() => Text(profilePickController.u.toString(),style: TextStyle(color: Colors.black),)),
          Obx(() =>
              CircleAvatar(radius: 100, backgroundImage: profileImage().image)),
          h2,
          ElevatedButton(
            onPressed: () async {
              Get.defaultDialog(
                  content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          pcontroller.imageFromGallery();
                          Get.back();
                        },
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: appColor),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          pcontroller.imageFromCamara();
                          Get.back();
                        },
                        child: Text(
                          'Camara',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: appColor),
                      ),
                    )
                  ],
                ),
              ));
            },
            child: Text(
              'Upload Image',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: appColor),
          ),
          h2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // final fImage = await picker.pickImage(
                  //     source: ImageSource.gallery);
                  // image = fImage!.path;
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: appColor),
              ),
              // Spacer(),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  await pcontroller.uploadProfilePick();
                  Get.off(BottumNavBarScreen());
                },
                child: Text(
                  'Upload',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: appColor),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
