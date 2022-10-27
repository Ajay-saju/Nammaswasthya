import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import 'login_api_model/login_api_call.dart';
import 'login_api_model/login_model_class.dart';

class OtpVerificationController extends GetxController {
  String enterdOtp = '';

  var full_name;

  Rx<UserLogin> userloginModel = UserLogin().obs;

  Future<UserLogin?> userLogin(String mobileNo, String status) async {
    final userPhoneNumberVerificationApiCall =
        UserPhoneNumberVerificationApiCall();

    Map<String, dynamic> numberVerifi = {
      "phone_no": mobileNo,
      "verify": status
    };

    try {
      final response =
          await userPhoneNumberVerificationApiCall.userLoginCheck(numberVerifi);

      // log(response.data);
      // log(response.statusMessage.toString());
      var jsonFi = jsonDecode(response.data);

      var js = jsonFi["status"];
      print("printing_json${js}");

      if (js == "success") {
        print("checking1");
        // Get.defaultDialog(
        //     title: 'Success', middleText: 'Your mobile number verified');

        // print('login model  :${response.data}');

        userloginModel.value = UserLogin.fromJson(jsonFi);

        print(userloginModel.value.data!.fullName);

        await prefer.setString("id", userloginModel.value.data!.id.toString());
        await prefer.setString(
            'name', userloginModel.value.data!.fullName.toString());
        await prefer.setString(
            'city', userloginModel.value.data!.city.toString());
        print(prefer.getString('name'));

        Timer(Duration(seconds: 3), () {
          Get.to(() => BottumNavBarScreen());
        });
      } else {
        Get.defaultDialog(
            title: 'Wrong OTP', middleText: 'You are enterd a wrong OTP');
      }
      if (jsonFi["status"].toString() == "false") {
        Get.defaultDialog(
            title: 'Wrong OTP', middleText: 'You are enterd a wrong OTP');
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
    update();
  }
}
