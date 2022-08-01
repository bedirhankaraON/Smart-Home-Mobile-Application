import 'package:smartix/core/data_result.dart';

abstract class UseCase<Type, Params> {
  Future<DataResult<Type>> call(Params params);
}

abstract class SyncUseCase<Type, Params> {
  DataResult<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<DataResult<Type>> call();
}

abstract class SyncUseCaseWithoutParams<Type> {
  DataResult<Type> call();
}
