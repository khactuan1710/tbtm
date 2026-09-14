import 'package:freezed_annotation/freezed_annotation.dart';

part 'effects.freezed.dart';

/// One-shot UI effects emitted by [BaseCubit] and rendered by [EffectListener]
/// (loading overlay, success/error snackbars). Kept out of screen state so they
/// fire once and never re-trigger on rebuild.
@freezed
sealed class Effect with _$Effect {
  const factory Effect.showLoading() = ShowLoading;
  const factory Effect.hideLoading() = HideLoading;
  const factory Effect.showError(String message) = ShowError;
  const factory Effect.showSuccess(String message) = ShowSuccess;
}
