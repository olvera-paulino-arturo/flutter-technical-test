abstract class UseCaseBase<T> {
  Future<T> execute();
}

abstract class UseCase<T,Params> {
  Future<T> execute(Params params);
}