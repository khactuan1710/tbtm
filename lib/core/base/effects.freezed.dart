// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Effect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Effect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Effect()';
}


}

/// @nodoc
class $EffectCopyWith<$Res>  {
$EffectCopyWith(Effect _, $Res Function(Effect) __);
}


/// Adds pattern-matching-related methods to [Effect].
extension EffectPatterns on Effect {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowLoading value)?  showLoading,TResult Function( HideLoading value)?  hideLoading,TResult Function( ShowError value)?  showError,TResult Function( ShowSuccess value)?  showSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowLoading() when showLoading != null:
return showLoading(_that);case HideLoading() when hideLoading != null:
return hideLoading(_that);case ShowError() when showError != null:
return showError(_that);case ShowSuccess() when showSuccess != null:
return showSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowLoading value)  showLoading,required TResult Function( HideLoading value)  hideLoading,required TResult Function( ShowError value)  showError,required TResult Function( ShowSuccess value)  showSuccess,}){
final _that = this;
switch (_that) {
case ShowLoading():
return showLoading(_that);case HideLoading():
return hideLoading(_that);case ShowError():
return showError(_that);case ShowSuccess():
return showSuccess(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowLoading value)?  showLoading,TResult? Function( HideLoading value)?  hideLoading,TResult? Function( ShowError value)?  showError,TResult? Function( ShowSuccess value)?  showSuccess,}){
final _that = this;
switch (_that) {
case ShowLoading() when showLoading != null:
return showLoading(_that);case HideLoading() when hideLoading != null:
return hideLoading(_that);case ShowError() when showError != null:
return showError(_that);case ShowSuccess() when showSuccess != null:
return showSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  showLoading,TResult Function()?  hideLoading,TResult Function( String message)?  showError,TResult Function( String message)?  showSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowLoading() when showLoading != null:
return showLoading();case HideLoading() when hideLoading != null:
return hideLoading();case ShowError() when showError != null:
return showError(_that.message);case ShowSuccess() when showSuccess != null:
return showSuccess(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  showLoading,required TResult Function()  hideLoading,required TResult Function( String message)  showError,required TResult Function( String message)  showSuccess,}) {final _that = this;
switch (_that) {
case ShowLoading():
return showLoading();case HideLoading():
return hideLoading();case ShowError():
return showError(_that.message);case ShowSuccess():
return showSuccess(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  showLoading,TResult? Function()?  hideLoading,TResult? Function( String message)?  showError,TResult? Function( String message)?  showSuccess,}) {final _that = this;
switch (_that) {
case ShowLoading() when showLoading != null:
return showLoading();case HideLoading() when hideLoading != null:
return hideLoading();case ShowError() when showError != null:
return showError(_that.message);case ShowSuccess() when showSuccess != null:
return showSuccess(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ShowLoading implements Effect {
  const ShowLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Effect.showLoading()';
}


}




/// @nodoc


class HideLoading implements Effect {
  const HideLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HideLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Effect.hideLoading()';
}


}




/// @nodoc


class ShowError implements Effect {
  const ShowError(this.message);
  

 final  String message;

/// Create a copy of Effect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowErrorCopyWith<ShowError> get copyWith => _$ShowErrorCopyWithImpl<ShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Effect.showError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowErrorCopyWith<$Res> implements $EffectCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) _then) = _$ShowErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowErrorCopyWithImpl<$Res>
    implements $ShowErrorCopyWith<$Res> {
  _$ShowErrorCopyWithImpl(this._self, this._then);

  final ShowError _self;
  final $Res Function(ShowError) _then;

/// Create a copy of Effect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ShowSuccess implements Effect {
  const ShowSuccess(this.message);
  

 final  String message;

/// Create a copy of Effect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSuccessCopyWith<ShowSuccess> get copyWith => _$ShowSuccessCopyWithImpl<ShowSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Effect.showSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowSuccessCopyWith<$Res> implements $EffectCopyWith<$Res> {
  factory $ShowSuccessCopyWith(ShowSuccess value, $Res Function(ShowSuccess) _then) = _$ShowSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowSuccessCopyWithImpl<$Res>
    implements $ShowSuccessCopyWith<$Res> {
  _$ShowSuccessCopyWithImpl(this._self, this._then);

  final ShowSuccess _self;
  final $Res Function(ShowSuccess) _then;

/// Create a copy of Effect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
