import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../main.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import '../home_screen/home_screen.dart';

class SplashScreenController extends GetxController {
  var localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isweak = false.obs;
  var isStrong = false.obs;
  var isUserAuthenticated = false.obs;

  void getAllBioMetrics() async {
    bool hasLocalOthentication = await localAuth.canCheckBiometrics;
    bool hasPinlock = await localAuth.isDeviceSupported();
    print(hasPinlock.toString());
    final bool canAuthenticate =
        hasLocalOthentication || await localAuth.isDeviceSupported();

    print(canAuthenticate);

    if (hasLocalOthentication) {
      List<BiometricType> availableBiometric =
          await localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometric.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometric.contains(BiometricType.fingerprint);
    } else {
      Get.snackbar('Error', 'LocalAuthentication  is not available',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red);
    }
  }

  void authenticateUser() async {
    // getAllBioMetrics();

    try {
      // const androidMessage= const AndroidAuthMasseges();
      isUserAuthenticated.value = await localAuth.authenticate(
          localizedReason: 'Authenticate YourSelf',
          options: AuthenticationOptions(
              biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
          authMessages: []);

           if(isUserAuthenticated.value){
            if (prefer.getString('id') == null) 
          Get.to(const PhoneNumberVerificationScreen());
         else 
          Get.to(BottumNavBarScreen());
          }

      print(isUserAuthenticated.value);
      // return isUserAuthenticated.value;
    } on PlatformException catch (e) {
      // return false;
    }
  }
}
