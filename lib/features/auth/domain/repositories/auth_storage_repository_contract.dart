import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';

abstract class AuthStorageRepositoryContract {

  Future<AuthModel?> getUserData();
  Future<void> savaUserData(AuthModel authModel);
  Future<void> logout();

}