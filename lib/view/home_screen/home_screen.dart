import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/core/colors.dart';
import 'package:swasthya/view/home_screen/otp_api_call.dart';
import 'package:swasthya/view/home_screen/phone_no_verification_controller.dart';
import 'package:swasthya/view/otp_verification_screen/otp_verification_screen.dart';

import '../core/constent_size.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
  const PhoneNumberVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNOController = Get.put(PhoneNoVerificationController());
    final otpApiCall = OtpApiCall();
    // GlobalKey<FormState>formK

    // MediaQueryData queryData;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25, top: 50),
                  child: Image.asset(
                    'asset/images/nammaswasthyalogo.png',
                    width: 280,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "What's your phone number ? ",
                  style: TextStyle(
                      letterSpacing: 0.8,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'We need this to identify your unique identity.',
                  style: TextStyle(
                      letterSpacing: 0.8,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: context.width*.9,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.8, color: Colors.black38)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '+91',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 30,
                        width: 2.5,
                        color: Colors.grey[350],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: context.width * 0.7,
                        child: Form(
                          // autovalidateMode: AutovalidateMode.always,
                          // key:formKey,
                          child: TextFormField(
                            // controller: phoneNOController.mobileNO,

                            keyboardAppearance: Brightness.light,
                            // controller: otpController,

                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              phoneNOController.phoneNo = value;
                              print(phoneNOController.phoneNo);
                            },
                            // onSaved: (newValue) {
                            //   phoneNo = newValue;
                            //   print(phoneNo);
                            // },

                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            keyboardType: TextInputType.phone,
                            // keyboardAppearance: Brightness.light,
                            // validator: ()=>null,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Enter your mobile number',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 17,
                                fontFamily: "Nunito",
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              phoneNOController.visibility.value == true
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "* Enter your correct phone number",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: "Nunito",
                        ),
                      ),
                    )
                  : Text(""),
              h2,h1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (phoneNOController.phoneNo.isNotEmpty &&
                          phoneNOController.phoneNo.length > 9) {
                        phoneNOController.visibility.value = false;
                        phoneNOController.otp = grnarateOtp().toString();

                        print(phoneNOController.phoneNo);
                        print(phoneNOController.otp);

                        otpApiCall.getHttp(
                            phoneNOController.otp, phoneNOController.phoneNo);

                        Get.to(OtpVerificationScreen(
                          enterdPhoneNumber: phoneNOController.phoneNo,
                          otp: phoneNOController.otp,
                        ));
                      } else {
                        phoneNOController.visibility.value = true;
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
                        'Continue',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int grnarateOtp() {
    var rng = Random();

    var otp = (rng.nextInt(5000) + 1001);
    // print(otp);

    return otp;
  }

  phoneNumberValidation(value) {}
}
