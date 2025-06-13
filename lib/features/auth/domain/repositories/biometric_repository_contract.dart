abstract class BiometricRepositoryContract {

  Future<bool> hasBiometrics();

  Future<bool> authenticate(String message);
}