import 'package:local_auth/local_auth.dart';

// ignore: avoid_classes_with_only_static_members
class UserAuthenticator {
  static Future<bool> authenticateUser() async {
    final localAuth = LocalAuthentication();
    if (await localAuth.canCheckBiometrics) {
      final result = await localAuth.authenticate(
        localizedReason: "We want to make sure you're the owner of the device in order to secure your wallet data",
      );
      return result;
    }
    return true;
  }
}
