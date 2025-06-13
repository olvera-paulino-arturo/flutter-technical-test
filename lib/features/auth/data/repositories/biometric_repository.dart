import 'package:contpaqi_technical_test/features/auth/data/data_sources/local/biometric_datasource.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/biometric_repository_contract.dart';

class BiometricRepository implements BiometricRepositoryContract {
  final BiometricDataSource _biometricDataSource = BiometricDataSource();

  @override
  Future<bool> authenticate(String message) {
    return _biometricDataSource.authenticate(message);
  }

  @override
  Future<bool> hasBiometrics() async {
    return _biometricDataSource.canAuthenticate();
  }

}