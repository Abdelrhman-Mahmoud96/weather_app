abstract class IUseCaseWithStream<Type, Params> {
  Stream<Type> call({required Params params});
}
