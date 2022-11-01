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

  Future<bool> getAllBioMetrics() async {
    bool hasLocalOthentication = await localAuth.canCheckBiometrics;

    final bool canAuthenticate =
        hasLocalOthentication || await localAuth.isDeviceSupported();

    print(canAuthenticate);

    if (hasLocalOthentication) {
      List<BiometricType> availableBiometric =
          await localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometric.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometric.contains(BiometricType.fingerprint);
      return true;
    } else {
      Get.snackbar('Error', 'LocalAuthentication  is not available',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red);
      return false;
    }
  }

  // authContoll() async {
  //   var bio = prefer.getBool('bio');
  //   if (bio == true) {
  //     authenticateUser();
  //   } else
  //     Get.offAll(PhoneNumberVerificationScreen());
  // }

  void authenticateUser() async {

    bool yes = await getAllBioMetrics();

    if (yes) {
      try {
        isUserAuthenticated.value = await localAuth.authenticate(
            localizedReason: 'Authenticate YourSelf',
            options: AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
            authMessages: []);

        if (isUserAuthenticated.value) {
          if (prefer.getString('id') == null)
            Get.offAll(PhoneNumberVerificationScreen());
          else
            Get.offAll(BottumNavBarScreen());
        }

        print(isUserAuthenticated.value);
      } on PlatformException catch (e) {}
    } else {
      try {
        bool pass = await localAuth.authenticate(
          localizedReason: 'Authenticate with pattern/pin/passcode',
        );
        if (pass) {
          if (prefer.getString('id') == null)
            Get.offAll(PhoneNumberVerificationScreen());
          else
            Get.offAll(BottumNavBarScreen());
        }
        print(isUserAuthenticated.value);
      } on PlatformException catch (e) {}
    }
  }
}
