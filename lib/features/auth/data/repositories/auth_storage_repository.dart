import 'package:contpaqi_technical_test/features/app/domain/models/local/catalogs/storage_key.dart';
import 'package:contpaqi_technical_test/features/auth/data/data_sources/local/auth_storage.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/auth_storage_repository_contract.dart';

class AuthStorageRepository implements AuthStorageRepositoryContract {
  final AuthStorage _authStorage = AuthStorage();

  @override
  Future<AuthModel?> getUserData() async {
    return _authStorage.read(StorageKey.auth);
  }

  @override
  Future<void> logout() async {
    _authStorage.cleanAll();
  }

  @override
  Future<void> savaUserData(AuthModel authModel) async {
    _authStorage.write(StorageKey.auth, authModel);
  }

}