// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDetailState {

 UserEntity get user; bool get isSaving; bool get didChange;
/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailStateCopyWith<UserDetailState> get copyWith => _$UserDetailStateCopyWithImpl<UserDetailState>(this as UserDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailState&&(identical(other.user, user) || other.user == user)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.didChange, didChange) || other.didChange == didChange));
}


@override
int get hashCode => Object.hash(runtimeType,user,isSaving,didChange);

@override
String toString() {
  return 'UserDetailState(user: $user, isSaving: $isSaving, didChange: $didChange)';
}


}

/// @nodoc
abstract mixin class $UserDetailStateCopyWith<$Res>  {
  factory $UserDetailStateCopyWith(UserDetailState value, $Res Function(UserDetailState) _then) = _$UserDetailStateCopyWithImpl;
@useResult
$Res call({
 UserEntity user, bool isSaving, bool didChange
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$UserDetailStateCopyWithImpl<$Res>
    implements $UserDetailStateCopyWith<$Res> {
  _$UserDetailStateCopyWithImpl(this._self, this._then);

  final UserDetailState _self;
  final $Res Function(UserDetailState) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? isSaving = null,Object? didChange = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,didChange: null == didChange ? _self.didChange : didChange // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDetailState].
extension UserDetailStatePatterns on UserDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailState value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity user,  bool isSaving,  bool didChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailState() when $default != null:
return $default(_that.user,_that.isSaving,_that.didChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity user,  bool isSaving,  bool didChange)  $default,) {final _that = this;
switch (_that) {
case _UserDetailState():
return $default(_that.user,_that.isSaving,_that.didChange);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity user,  bool isSaving,  bool didChange)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailState() when $default != null:
return $default(_that.user,_that.isSaving,_that.didChange);case _:
  return null;

}
}

}

/// @nodoc


class _UserDetailState extends UserDetailState {
  const _UserDetailState({required this.user, this.isSaving = false, this.didChange = false}): super._();
  

@override final  UserEntity user;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool didChange;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailStateCopyWith<_UserDetailState> get copyWith => __$UserDetailStateCopyWithImpl<_UserDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailState&&(identical(other.user, user) || other.user == user)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.didChange, didChange) || other.didChange == didChange));
}


@override
int get hashCode => Object.hash(runtimeType,user,isSaving,didChange);

@override
String toString() {
  return 'UserDetailState(user: $user, isSaving: $isSaving, didChange: $didChange)';
}


}

/// @nodoc
abstract mixin class _$UserDetailStateCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory _$UserDetailStateCopyWith(_UserDetailState value, $Res Function(_UserDetailState) _then) = __$UserDetailStateCopyWithImpl;
@override @useResult
$Res call({
 UserEntity user, bool isSaving, bool didChange
});


@override $UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class __$UserDetailStateCopyWithImpl<$Res>
    implements _$UserDetailStateCopyWith<$Res> {
  __$UserDetailStateCopyWithImpl(this._self, this._then);

  final _UserDetailState _self;
  final $Res Function(_UserDetailState) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? isSaving = null,Object? didChange = null,}) {
  return _then(_UserDetailState(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,didChange: null == didChange ? _self.didChange : didChange // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
