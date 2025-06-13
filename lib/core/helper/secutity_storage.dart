import 'package:contpaqi_technical_test/features/app/data/data_sources/local/security_operations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage implements SecurityOperations{
  final FlutterSecureStorage _storage;

  static final AndroidOptions getAndroidOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  SecurityStorage._internal(this._storage);

  static final SecurityStorage _instance = SecurityStorage._internal(FlutterSecureStorage(aOptions: getAndroidOptions));

  factory SecurityStorage() {
    return _instance;
  }

  @override
  Future<void> cleanAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }



}