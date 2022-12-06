import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/otp_verification_screen/otp_verification_controller.dart';
import '../core/colors.dart';
import '../core/constent_size.dart';
import '../home_screen/phone_no_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String no;
  OtpVerificationScreen({
    super.key,
    required this.no,
  });

  final otpVerificationController = Get.put(OtpVerificationController());

  PhoneNoVerificationController contoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h5,
            Text(
              'Enter 4-digit OTP sent to',
              style: TextStyle(
                  fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "+91 $no",
              style: TextStyle(
                  fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(4)],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                otpVerificationController.enterdOtp = value;
              },
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
            h2,
            Text("Didn't receive code?",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
            h1,
            Obx(() => Text(
                'Resend OTP in ${otpVerificationController.seconds} sec ',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14))),
            h1,
            Obx(() => otpVerificationController.isVisible == true
                ? TextButton(
                    onPressed: () {
                      otpVerificationController.seconds.value = 60;
                      otpVerificationController.isStopTimer.value = true;
                      contoller.otpGenarate(no);
                    },
                    child: Text(
                      'Resnd OTP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                : SizedBox()),
            h2,
            ElevatedButton(
              onPressed: () async {
                print(otpVerificationController.enterdOtp);

                if (otpVerificationController.enterdOtp ==
                    contoller.otp.value) {
                  await otpVerificationController.userLogin(no, 'yes');
                } else {
                  await otpVerificationController.userLogin(no, 'no');

                  Get.defaultDialog(
                      title: 'Wrong OTP',
                      middleText: 'You are enterd a wrong OTP');
                }
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1)),
                  backgroundColor: appColor),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
