import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import 'login_api_model/login_api_call.dart';
import 'login_api_model/login_model_class.dart';
import 'package:image_cropper/image_cropper.dart';


class OtpVerificationController extends GetxController {
  

  @override
  void onInit() {
    isStopTimer.value = true;
    startTimer();
    var name = prefer.getString('name').toString();
    print(
        "==========================================================================$name");

    super.onInit();
  }

  @override
  void dispose() {
    isStopTimer.value = false;
  }

  static const maxSeconds = 60;
  Timer? countdownTimer;

  RxInt seconds = maxSeconds.obs;
  var isStopTimer = true.obs;
  var isVisible = false.obs;

  // void cropImage(FileImage imageFile )async{
  //   CroppedFile croppedFile = await ImageCropper().cropImage(sourcePath:imageFile.path,aspectRatioPresets:[] );
  // }
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 && isStopTimer == true) {
        seconds--;
        isVisible.value = false;
        print(seconds);
      } else {
        isVisible.value = true;
        isStopTimer.value = false;
        
      }
    });
  }

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

      var jsonFi = jsonDecode(response.data);

      var js = jsonFi["status"];
      print("printing_json${js}");

      if (js == "success") {
        print("checking1");

        userloginModel.value = UserLogin.fromJson(jsonFi);

        print(userloginModel.value.data!.fullName);

        await prefer.setString("id", userloginModel.value.data!.id.toString());
        await prefer.setString(
            'name', userloginModel.value.data!.fullName.toString());
        await prefer.setString(
            'city', userloginModel.value.data!.city.toString());
        print(prefer.getString('name'));

        Timer(Duration(milliseconds: 5), () {
          isStopTimer.value = false;
          print(isStopTimer.value.toString());
          Get.off(() => BottumNavBarScreen());
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
