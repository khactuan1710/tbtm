import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quanlymaygiat/core/errors/failures.dart';
import 'package:quanlymaygiat/core/network/dio_failure_mapper.dart';
import 'package:quanlymaygiat/core/utils/typedefs.dart';

/// Runs a repository [action], converting any thrown error into a
/// `Left(Failure)`. Repositories wrap every remote call in this so callers
/// always receive a [Result] instead of an exception.
Future<Result<T>> runSafely<T>(Future<Result<T>> Function() action) async {
  try {
    return await action();
  } on DioException catch (e) {
    final failure = e.error is Failure
        ? e.error as Failure
        : mapDioExceptionToFailure(e);
    return left(failure);
  } catch (e, st) {
    return left(Failure.unknown(error: e, stackTrace: st));
  }
}
