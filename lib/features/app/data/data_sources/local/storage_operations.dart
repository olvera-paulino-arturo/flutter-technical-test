abstract class StorageOperations<T,E extends Enum> {
  Future<T?> read(E key);

  Future<void> delete(E key);

  Future<void> cleanAll();

  Future<void> write(E key, T value);

}