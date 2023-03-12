import 'package:fpdart/fpdart.dart';
import 'package:leske_share/core/error/failures.dart';

typedef FutureVoid = Future<void>;
typedef FutureBool = Future<bool>;
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherList<T> = FutureEither<List<T>>;
