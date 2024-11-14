abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
  Future<Type> call2(Params params);
}
