import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/otp_verification_screen/otp_verification_controller.dart';
import '../core/colors.dart';
import '../core/constent_size.dart';
import '../home_screen/phone_no_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String enterdPhoneNumber;
  final String otp;
  OtpVerificationScreen({
    super.key,
    required this.enterdPhoneNumber,
    required this.otp,
  });
  PhoneNoVerificationController phoneNoVerificationController =Get.find();

  @override
  Widget build(BuildContext context) {
    final otpVerificationControll = OtpVerificationController();
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
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
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
              "+91 $enterdPhoneNumber",
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
                otpVerificationControll.enterdOtp = value;
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
            InkWell(
              onTap: (){
                // phoneNoVerificationController.getHttp();

              },
              child: Text('Resend OTP in ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
            ),
            h2,
            h1,
            ElevatedButton(
              onPressed: () async {
                print(otpVerificationControll.enterdOtp);
                print(otp);
                if (otpVerificationControll.enterdOtp == otp) {
                  await otpVerificationControll.userLogin(
                      enterdPhoneNumber, 'yes');
                } else {
                  await otpVerificationControll.userLogin(
                      enterdPhoneNumber, 'no');

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
