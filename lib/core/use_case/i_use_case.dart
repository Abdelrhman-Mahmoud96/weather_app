abstract class IUseCase<Type, Params> {
  Future<Type> call({required Params params});
}

class NoParams {
  const NoParams();
}
