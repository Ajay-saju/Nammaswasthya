import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoacalAuth {
  static final auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await auth.authenticate(
          localizedReason: 'Scan fingerprint to Authenticate',
          options:
              AuthenticationOptions(useErrorDialogs: true, stickyAuth: true));
              
    } on PlatformException catch (e) {
      return false;
    }
  }
}
