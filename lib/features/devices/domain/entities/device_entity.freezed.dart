// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceEntity {

 String get deviceId; String get currentStatus; String get deviceName; String get deviceFullName; String get userId; String get deviceType; String get machineType; String get address; double? get percentAppDeducted; List<ServiceEntity> get services;
/// Create a copy of DeviceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceEntityCopyWith<DeviceEntity> get copyWith => _$DeviceEntityCopyWithImpl<DeviceEntity>(this as DeviceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceEntity&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceFullName, deviceFullName) || other.deviceFullName == deviceFullName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.machineType, machineType) || other.machineType == machineType)&&(identical(other.address, address) || other.address == address)&&(identical(other.percentAppDeducted, percentAppDeducted) || other.percentAppDeducted == percentAppDeducted)&&const DeepCollectionEquality().equals(other.services, services));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,currentStatus,deviceName,deviceFullName,userId,deviceType,machineType,address,percentAppDeducted,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'DeviceEntity(deviceId: $deviceId, currentStatus: $currentStatus, deviceName: $deviceName, deviceFullName: $deviceFullName, userId: $userId, deviceType: $deviceType, machineType: $machineType, address: $address, percentAppDeducted: $percentAppDeducted, services: $services)';
}


}

/// @nodoc
abstract mixin class $DeviceEntityCopyWith<$Res>  {
  factory $DeviceEntityCopyWith(DeviceEntity value, $Res Function(DeviceEntity) _then) = _$DeviceEntityCopyWithImpl;
@useResult
$Res call({
 String deviceId, String currentStatus, String deviceName, String deviceFullName, String userId, String deviceType, String machineType, String address, double? percentAppDeducted, List<ServiceEntity> services
});




}
/// @nodoc
class _$DeviceEntityCopyWithImpl<$Res>
    implements $DeviceEntityCopyWith<$Res> {
  _$DeviceEntityCopyWithImpl(this._self, this._then);

  final DeviceEntity _self;
  final $Res Function(DeviceEntity) _then;

/// Create a copy of DeviceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? currentStatus = null,Object? deviceName = null,Object? deviceFullName = null,Object? userId = null,Object? deviceType = null,Object? machineType = null,Object? address = null,Object? percentAppDeducted = freezed,Object? services = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceFullName: null == deviceFullName ? _self.deviceFullName : deviceFullName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,machineType: null == machineType ? _self.machineType : machineType // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,percentAppDeducted: freezed == percentAppDeducted ? _self.percentAppDeducted : percentAppDeducted // ignore: cast_nullable_to_non_nullable
as double?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceEntity].
extension DeviceEntityPatterns on DeviceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeviceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String currentStatus,  String deviceName,  String deviceFullName,  String userId,  String deviceType,  String machineType,  String address,  double? percentAppDeducted,  List<ServiceEntity> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceEntity() when $default != null:
return $default(_that.deviceId,_that.currentStatus,_that.deviceName,_that.deviceFullName,_that.userId,_that.deviceType,_that.machineType,_that.address,_that.percentAppDeducted,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String currentStatus,  String deviceName,  String deviceFullName,  String userId,  String deviceType,  String machineType,  String address,  double? percentAppDeducted,  List<ServiceEntity> services)  $default,) {final _that = this;
switch (_that) {
case _DeviceEntity():
return $default(_that.deviceId,_that.currentStatus,_that.deviceName,_that.deviceFullName,_that.userId,_that.deviceType,_that.machineType,_that.address,_that.percentAppDeducted,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String currentStatus,  String deviceName,  String deviceFullName,  String userId,  String deviceType,  String machineType,  String address,  double? percentAppDeducted,  List<ServiceEntity> services)?  $default,) {final _that = this;
switch (_that) {
case _DeviceEntity() when $default != null:
return $default(_that.deviceId,_that.currentStatus,_that.deviceName,_that.deviceFullName,_that.userId,_that.deviceType,_that.machineType,_that.address,_that.percentAppDeducted,_that.services);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceEntity extends DeviceEntity {
  const _DeviceEntity({this.deviceId = '', this.currentStatus = '', this.deviceName = '', this.deviceFullName = '', this.userId = '', this.deviceType = '', this.machineType = '', this.address = '', this.percentAppDeducted, final  List<ServiceEntity> services = const <ServiceEntity>[]}): _services = services,super._();
  

@override@JsonKey() final  String deviceId;
@override@JsonKey() final  String currentStatus;
@override@JsonKey() final  String deviceName;
@override@JsonKey() final  String deviceFullName;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String deviceType;
@override@JsonKey() final  String machineType;
@override@JsonKey() final  String address;
@override final  double? percentAppDeducted;
 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of DeviceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceEntityCopyWith<_DeviceEntity> get copyWith => __$DeviceEntityCopyWithImpl<_DeviceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceEntity&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceFullName, deviceFullName) || other.deviceFullName == deviceFullName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.machineType, machineType) || other.machineType == machineType)&&(identical(other.address, address) || other.address == address)&&(identical(other.percentAppDeducted, percentAppDeducted) || other.percentAppDeducted == percentAppDeducted)&&const DeepCollectionEquality().equals(other._services, _services));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,currentStatus,deviceName,deviceFullName,userId,deviceType,machineType,address,percentAppDeducted,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'DeviceEntity(deviceId: $deviceId, currentStatus: $currentStatus, deviceName: $deviceName, deviceFullName: $deviceFullName, userId: $userId, deviceType: $deviceType, machineType: $machineType, address: $address, percentAppDeducted: $percentAppDeducted, services: $services)';
}


}

/// @nodoc
abstract mixin class _$DeviceEntityCopyWith<$Res> implements $DeviceEntityCopyWith<$Res> {
  factory _$DeviceEntityCopyWith(_DeviceEntity value, $Res Function(_DeviceEntity) _then) = __$DeviceEntityCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String currentStatus, String deviceName, String deviceFullName, String userId, String deviceType, String machineType, String address, double? percentAppDeducted, List<ServiceEntity> services
});




}
/// @nodoc
class __$DeviceEntityCopyWithImpl<$Res>
    implements _$DeviceEntityCopyWith<$Res> {
  __$DeviceEntityCopyWithImpl(this._self, this._then);

  final _DeviceEntity _self;
  final $Res Function(_DeviceEntity) _then;

/// Create a copy of DeviceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? currentStatus = null,Object? deviceName = null,Object? deviceFullName = null,Object? userId = null,Object? deviceType = null,Object? machineType = null,Object? address = null,Object? percentAppDeducted = freezed,Object? services = null,}) {
  return _then(_DeviceEntity(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceFullName: null == deviceFullName ? _self.deviceFullName : deviceFullName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,machineType: null == machineType ? _self.machineType : machineType // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,percentAppDeducted: freezed == percentAppDeducted ? _self.percentAppDeducted : percentAppDeducted // ignore: cast_nullable_to_non_nullable
as double?,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,
  ));
}


}

// dart format on
