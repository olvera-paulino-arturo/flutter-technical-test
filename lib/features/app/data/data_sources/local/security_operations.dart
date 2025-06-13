abstract class SecurityOperations {
  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> cleanAll();

  Future<void> write(String key, String value);
}