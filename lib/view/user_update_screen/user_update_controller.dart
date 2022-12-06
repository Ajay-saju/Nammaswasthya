import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/bottom_navigation_bar/navigation_screen.dart';
import 'package:swasthya/view/user_update_screen/user_profile_update_service.dart';
import '../profile_screen/profile_screen_models/get_user_details_model.dart';

class UserUpdatecontroller extends GetxController {
  final userProfileUpdateService = UserProfileUpdateService();

  TextEditingController dob = TextEditingController();
  // Rx<GetUserProfileDetails> getUserProfileDetails = GetUserProfileDetails().obs;

  // var getUserProfileDetails =GetUserProfileDetails().obs;

  String? bloodgroupSelect ;
  String? genderSelect ;
  List<String> boodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  List<String> gender=['Male', 'Female',];
  bool isBloodGroupSelected = false;
  bool isGenderSelected =false;

  updateUserProfile(
      String name,
      String email,
      String phone_no,
      String blood_group,
      String dob,
      String gender,
      String occupation,
      String state,
      String city,
      String pincode) async {
    Map<String, dynamic> details = {
      "user_id": prefer.get('id').toString(),
      "fullname": name,
      "phone": phone_no,
      "blood_group": blood_group,
      "email": email,
      "dob": dob,
      "gender": gender,
      "occupation": occupation,
      "state": state,
      "city": city,
      "pincode": pincode
    };

    try {
      // dio.FormData formData = dio.FormData.fromMap({
      //   "user_id": prefer.get('id').toString(),
      //   "fullname": name,
      //   "phone": phone_no,
      //   "blood_group": blood_group,
      //   "email": email,
      //   "dob": dob,
      //   "gender": gender,
      //   "occupation": occupation,
      //   "state": state,
      //   "city": city,
      //   "pincode": pincode
      // });
      // formData.fields.forEach((element) {print(element.toString());});
      final response = await userProfileUpdateService.updateUserdata(details);
      print("printing_res${response.toString()}");
      log(response.data);
      var jsonFile = jsonDecode(response.data);
      if (jsonFile["status"] == "success")
        Get.defaultDialog(
            title: 'Success', middleText: 'Update your profile successfully');
      Get.to(BottumNavBarScreen());
    } catch (e) {
      return null;
    }
    update();
  }
}
