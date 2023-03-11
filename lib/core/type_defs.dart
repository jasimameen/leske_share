import 'package:fpdart/fpdart.dart';

typedef FutureVoid = Future<void>;
typedef FutureBool = Future<bool>;
typedef FutureEither<T> = Future<Either<String, T>>;
typedef FutureEitherList<T> = FutureEither<List<T>>;