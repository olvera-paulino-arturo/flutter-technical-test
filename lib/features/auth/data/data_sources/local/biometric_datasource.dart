import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class BiometricDataSource {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate(String localizedReason) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: localizedReason,
          options: const AuthenticationOptions(useErrorDialogs: false));
      return didAuthenticate;

    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        return false;
      } else if (e.code == auth_error.notEnrolled) {
        return false;
      } else {
        return false;
      }
    }
  }

  Future<bool> canAuthenticate() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    return canAuthenticate;
  }
}