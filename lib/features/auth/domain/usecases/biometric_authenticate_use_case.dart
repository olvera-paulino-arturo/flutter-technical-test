import 'package:contpaqi_technical_test/features/app/domain/repositories/usecase.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/biometric_repository_contract.dart';

class BiometricAuthenticateUseCase implements UseCase<bool, String> {
  final BiometricRepositoryContract repository;

  BiometricAuthenticateUseCase({required this.repository});

  @override
  Future<bool> execute(String params) async {
    final bool hasBiometrics = await repository.hasBiometrics();
    if (hasBiometrics) {
      return repository.authenticate(params);
    }
    return hasBiometrics;
  }
}
