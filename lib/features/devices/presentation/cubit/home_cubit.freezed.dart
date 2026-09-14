// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 bool get isLoading; bool get hasError; List<DeviceEntity> get allDevices; List<DeviceEntity> get devices; String get query; int get defaultMinutes; AuthUser? get user; String? get togglingDeviceId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&const DeepCollectionEquality().equals(other.allDevices, allDevices)&&const DeepCollectionEquality().equals(other.devices, devices)&&(identical(other.query, query) || other.query == query)&&(identical(other.defaultMinutes, defaultMinutes) || other.defaultMinutes == defaultMinutes)&&(identical(other.user, user) || other.user == user)&&(identical(other.togglingDeviceId, togglingDeviceId) || other.togglingDeviceId == togglingDeviceId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,const DeepCollectionEquality().hash(allDevices),const DeepCollectionEquality().hash(devices),query,defaultMinutes,user,togglingDeviceId);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, hasError: $hasError, allDevices: $allDevices, devices: $devices, query: $query, defaultMinutes: $defaultMinutes, user: $user, togglingDeviceId: $togglingDeviceId)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasError, List<DeviceEntity> allDevices, List<DeviceEntity> devices, String query, int defaultMinutes, AuthUser? user, String? togglingDeviceId
});


$AuthUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasError = null,Object? allDevices = null,Object? devices = null,Object? query = null,Object? defaultMinutes = null,Object? user = freezed,Object? togglingDeviceId = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,allDevices: null == allDevices ? _self.allDevices : allDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceEntity>,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,defaultMinutes: null == defaultMinutes ? _self.defaultMinutes : defaultMinutes // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser?,togglingDeviceId: freezed == togglingDeviceId ? _self.togglingDeviceId : togglingDeviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  List<DeviceEntity> allDevices,  List<DeviceEntity> devices,  String query,  int defaultMinutes,  AuthUser? user,  String? togglingDeviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.allDevices,_that.devices,_that.query,_that.defaultMinutes,_that.user,_that.togglingDeviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  List<DeviceEntity> allDevices,  List<DeviceEntity> devices,  String query,  int defaultMinutes,  AuthUser? user,  String? togglingDeviceId)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isLoading,_that.hasError,_that.allDevices,_that.devices,_that.query,_that.defaultMinutes,_that.user,_that.togglingDeviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasError,  List<DeviceEntity> allDevices,  List<DeviceEntity> devices,  String query,  int defaultMinutes,  AuthUser? user,  String? togglingDeviceId)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.allDevices,_that.devices,_that.query,_that.defaultMinutes,_that.user,_that.togglingDeviceId);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({this.isLoading = true, this.hasError = false, final  List<DeviceEntity> allDevices = const <DeviceEntity>[], final  List<DeviceEntity> devices = const <DeviceEntity>[], this.query = '', this.defaultMinutes = 30, this.user, this.togglingDeviceId}): _allDevices = allDevices,_devices = devices,super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;
 final  List<DeviceEntity> _allDevices;
@override@JsonKey() List<DeviceEntity> get allDevices {
  if (_allDevices is EqualUnmodifiableListView) return _allDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allDevices);
}

 final  List<DeviceEntity> _devices;
@override@JsonKey() List<DeviceEntity> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

@override@JsonKey() final  String query;
@override@JsonKey() final  int defaultMinutes;
@override final  AuthUser? user;
@override final  String? togglingDeviceId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&const DeepCollectionEquality().equals(other._allDevices, _allDevices)&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.query, query) || other.query == query)&&(identical(other.defaultMinutes, defaultMinutes) || other.defaultMinutes == defaultMinutes)&&(identical(other.user, user) || other.user == user)&&(identical(other.togglingDeviceId, togglingDeviceId) || other.togglingDeviceId == togglingDeviceId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,const DeepCollectionEquality().hash(_allDevices),const DeepCollectionEquality().hash(_devices),query,defaultMinutes,user,togglingDeviceId);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, hasError: $hasError, allDevices: $allDevices, devices: $devices, query: $query, defaultMinutes: $defaultMinutes, user: $user, togglingDeviceId: $togglingDeviceId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasError, List<DeviceEntity> allDevices, List<DeviceEntity> devices, String query, int defaultMinutes, AuthUser? user, String? togglingDeviceId
});


@override $AuthUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasError = null,Object? allDevices = null,Object? devices = null,Object? query = null,Object? defaultMinutes = null,Object? user = freezed,Object? togglingDeviceId = freezed,}) {
  return _then(_HomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,allDevices: null == allDevices ? _self._allDevices : allDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceEntity>,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,defaultMinutes: null == defaultMinutes ? _self.defaultMinutes : defaultMinutes // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser?,togglingDeviceId: freezed == togglingDeviceId ? _self.togglingDeviceId : togglingDeviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
