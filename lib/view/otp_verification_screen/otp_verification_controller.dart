import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/home_screen/otp_api_call.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import '../home_screen/home_screen.dart';
import 'login_api_model/login_api_call.dart';
import 'login_api_model/login_model_class.dart';
import 'otp_verification_screen.dart';

class OtpVerificationController extends GetxController {
  final otpApiCall = OtpApiCall();
  final phoneNumberVerificationScreen = PhoneNumberVerificationScreen();

  @override
  void onInit() {
    isStopTimer.value = true;
    otpGenarate(
        phoneNumberVerificationScreen.phoneNOController.phoneNo.toString());
    startTimer();
    var name = prefer.getString('name').toString();
    print(
        "==========================================================================$name");

    super.onInit();
  }

  static const maxSeconds = 60;
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 30);
  RxInt seconds = maxSeconds.obs;
  var isStopTimer = true.obs;

  var otp = ''.obs;
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 && isStopTimer == true) {
        seconds--;
        print(seconds);
      } else {
        seconds.value = 60;
      
          otpGenarate(phoneNumberVerificationScreen.phoneNOController.phoneNo
              .toString());
        
      }
    });
  }

  otpGenarate(String mobileNumber) {
    if(isStopTimer==true){
       print(
        'Otp veeeeeeeeeeeeeeeeeeeeeeeeeeeendum work ayiiiiiiiiiiiiiiiiiiiiiiiii');
   
      otp.value = grnarateOtp().toString();
    }
   
    

    // otpApiCall.getHttp(otp.value, mobileNumber);
  }

  int grnarateOtp() {
    var rng = Random();

    var otp = (rng.nextInt(5000) + 1001);
    print(otp);
    return otp;
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

        Timer(Duration(milliseconds: 1), () {
          isStopTimer.value = false;
          print(isStopTimer.value.toString());
          Get.offAll(() => BottumNavBarScreen());
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
