import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/user_update_screen/user_profile_update_service.dart';


class UserUpdatecontroller extends GetxController {
  final userProfileUpdateService = UserProfileUpdateService();

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
    print("Method working");

    try {
      print(pincode);
      print(name);
      dio.FormData formData = dio.FormData.fromMap({
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
      });
      formData.fields.forEach((element) {print(element.toString());});
      final response = await userProfileUpdateService.updateUserdata(formData);
      print("printing_res${response.toString()}");
      log(response.data);
      var jsonFile = jsonDecode(response.data);
      if (jsonFile["status"] == "success")
        Get.defaultDialog(
            title: 'Success', middleText: 'Update your profile successfully');
    } catch (e) {
      return null;
    }
    update();
  }
}
