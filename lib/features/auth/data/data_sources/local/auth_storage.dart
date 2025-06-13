import 'package:contpaqi_technical_test/core/helper/secutity_storage.dart';
import 'package:contpaqi_technical_test/features/app/data/data_sources/local/storage_operations.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/local/catalogs/storage_key.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';

class AuthStorage implements StorageOperations<AuthModel, StorageKey> {
  final SecurityStorage _securityStorage = SecurityStorage();

  @override
  Future<void> cleanAll() async {
    _securityStorage.cleanAll();
  }

  @override
  Future<void> delete(StorageKey key) async {
    _securityStorage.delete(key.name);
  }

  @override
  Future<AuthModel?> read(StorageKey key) async {
    final String? value = await _securityStorage.read(key.name);
    if(value != null) {
      final AuthModel authModel = AuthModel.fromString(value);
      return authModel;
    }
    return null;
  }

  @override
  Future<void> write(StorageKey key, AuthModel value) async {
    final String data = value.toString();
    await _securityStorage.write(key.name, data);
  }


}
