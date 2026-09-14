import 'package:dartz/dartz.dart';
import 'package:quanlymaygiat/core/errors/failures.dart';

/// A network/repository result: `Left(Failure)` or `Right(value)`.
typedef Result<T> = Either<Failure, T>;
typedef ResultVoid = Result<void>;
