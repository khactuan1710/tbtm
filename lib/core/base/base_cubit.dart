import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlymaygiat/core/base/effects.dart';
import 'package:quanlymaygiat/core/base/execute_result_error.dart';
import 'package:quanlymaygiat/core/errors/failures.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/utils/typedefs.dart';

/// Base class for all cubits. Provides:
/// - one-shot [effects] (loading overlay + snackbars) via [showLoading] etc.
/// - [execute] / [executeResult] helpers that centralise loading + error UI so
///   screen state only ever carries data.
abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(super.initialState);

  final List<Effect> _pendingEffects = <Effect>[];
  late final StreamController<Effect> _effectsController =
      StreamController<Effect>.broadcast(onListen: _drainPendingEffects);

  Stream<Effect> get effects => _effectsController.stream;

  void _emitEffect(Effect effect) {
    if (_effectsController.isClosed) return;
    if (_effectsController.hasListener) {
      _effectsController.add(effect);
    } else {
      _pendingEffects.add(effect);
    }
  }

  void _drainPendingEffects() {
    if (_pendingEffects.isEmpty) return;
    final pending = List<Effect>.of(_pendingEffects);
    _pendingEffects.clear();
    scheduleMicrotask(() {
      if (_effectsController.isClosed) return;
      for (final effect in pending) {
        _effectsController.add(effect);
      }
    });
  }

  void showLoading() => _emitEffect(const Effect.showLoading());
  void hideLoading() => _emitEffect(const Effect.hideLoading());
  void showError(String message) => _emitEffect(Effect.showError(message));
  void showSuccess(String message) => _emitEffect(Effect.showSuccess(message));

  /// Runs a plain [task] with loading + error handling. Returns its result on
  /// success or `null` when an exception was caught.
  Future<T?> execute<T>(
    Future<T> Function() task, {
    bool isShowError = true,
    bool isLoading = true,
    void Function(String message)? onError,
  }) async {
    if (isLoading) showLoading();
    try {
      return await task();
    } catch (e) {
      final message = _messageFromError(e);
      onError?.call(message);
      if (isShowError) showError(message);
      return null;
    } finally {
      if (isLoading) hideLoading();
    }
  }

  /// Runs a repository call returning [Result]. Folds the [Either], shows the
  /// [Failure.displayMessage] on `Left`, and (when [validateApiEnvelope]) checks
  /// that a [HasApiEnvelope] payload has `isSuccess == true`, else shows its
  /// message. Returns the payload on success, otherwise `null`.
  Future<T?> executeResult<T>(
    Future<Result<T>> Function() task, {
    bool validateApiEnvelope = true,
    bool Function(T data)? customValidate,
    String fallbackApiMessage = 'Đã có lỗi xảy ra.',
    void Function(ExecuteResultError error)? onError,
    bool isLoading = true,
  }) async {
    void notifyError(ExecuteResultError error) {
      if (onError != null) {
        onError(error);
      } else {
        showError(error.message);
      }
    }

    if (isLoading) showLoading();
    try {
      final outcome = await task();
      return outcome.fold(
        (failure) {
          notifyError(
            ExecuteResultError(
              message: failure.displayMessage,
              failure: failure,
            ),
          );
          return null;
        },
        (data) {
          if (validateApiEnvelope && data is HasApiEnvelope) {
            final envelope = data as HasApiEnvelope;
            if (envelope.isSuccess == false) {
              notifyError(
                ExecuteResultError(
                  message: envelope.message ?? fallbackApiMessage,
                ),
              );
              return null;
            }
          }
          if (customValidate != null && !customValidate(data)) {
            return null;
          }
          return data;
        },
      );
    } catch (e) {
      notifyError(ExecuteResultError(message: _messageFromError(e)));
      return null;
    } finally {
      if (isLoading) hideLoading();
    }
  }

  String _messageFromError(Object e) {
    if (e is Failure) return e.displayMessage;
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map && data['message'] is String) {
        return data['message'] as String;
      }
    }
    return 'Đã có lỗi xảy ra.';
  }

  /// Guard against emitting after [close] (async tasks outliving the cubit).
  @override
  void emit(TState state) {
    if (!isClosed) super.emit(state);
  }

  @override
  Future<void> close() =>
      Future.wait([_effectsController.close(), super.close()]);
}
