import 'dart:math';
import 'package:get/get.dart';
import 'package:swasthya/view/home_screen/otp_api_call.dart';

class PhoneNoVerificationController extends GetxController{

   final otpApiCall = OtpApiCall();
  var otp = ''.obs;
  
    RxString phoneNo = ''.obs;
    RxBool visibility =false .obs;

otpGenarate(String mobileNumber) {
    otp.value = grnarateOtp().toString();
    otpApiCall.getHttp(otp.value, mobileNumber);
  }

    int grnarateOtp() {
    var rng = Random();

    var otp = (rng.nextInt(5000) + 1001);
    print(otp);
    return otp;
  }
    

    
}