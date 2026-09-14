// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceDetailState {

 DeviceEntity get device; String get ownerName; bool get isSaving; bool get didChange;// Toàn bộ tài khoản (chủ trọ) — để admin chọn khi gán lại thiết bị sang
// chủ khác (owner_picker.dart, giống màn Tạo thiết bị).
 List<UserEntity> get owners;
/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceDetailStateCopyWith<DeviceDetailState> get copyWith => _$DeviceDetailStateCopyWithImpl<DeviceDetailState>(this as DeviceDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceDetailState&&(identical(other.device, device) || other.device == device)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.didChange, didChange) || other.didChange == didChange)&&const DeepCollectionEquality().equals(other.owners, owners));
}


@override
int get hashCode => Object.hash(runtimeType,device,ownerName,isSaving,didChange,const DeepCollectionEquality().hash(owners));

@override
String toString() {
  return 'DeviceDetailState(device: $device, ownerName: $ownerName, isSaving: $isSaving, didChange: $didChange, owners: $owners)';
}


}

/// @nodoc
abstract mixin class $DeviceDetailStateCopyWith<$Res>  {
  factory $DeviceDetailStateCopyWith(DeviceDetailState value, $Res Function(DeviceDetailState) _then) = _$DeviceDetailStateCopyWithImpl;
@useResult
$Res call({
 DeviceEntity device, String ownerName, bool isSaving, bool didChange, List<UserEntity> owners
});


$DeviceEntityCopyWith<$Res> get device;

}
/// @nodoc
class _$DeviceDetailStateCopyWithImpl<$Res>
    implements $DeviceDetailStateCopyWith<$Res> {
  _$DeviceDetailStateCopyWithImpl(this._self, this._then);

  final DeviceDetailState _self;
  final $Res Function(DeviceDetailState) _then;

/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? ownerName = null,Object? isSaving = null,Object? didChange = null,Object? owners = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceEntity,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,didChange: null == didChange ? _self.didChange : didChange // ignore: cast_nullable_to_non_nullable
as bool,owners: null == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,
  ));
}
/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceEntityCopyWith<$Res> get device {
  
  return $DeviceEntityCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceDetailState].
extension DeviceDetailStatePatterns on DeviceDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceDetailState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeviceEntity device,  String ownerName,  bool isSaving,  bool didChange,  List<UserEntity> owners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceDetailState() when $default != null:
return $default(_that.device,_that.ownerName,_that.isSaving,_that.didChange,_that.owners);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeviceEntity device,  String ownerName,  bool isSaving,  bool didChange,  List<UserEntity> owners)  $default,) {final _that = this;
switch (_that) {
case _DeviceDetailState():
return $default(_that.device,_that.ownerName,_that.isSaving,_that.didChange,_that.owners);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeviceEntity device,  String ownerName,  bool isSaving,  bool didChange,  List<UserEntity> owners)?  $default,) {final _that = this;
switch (_that) {
case _DeviceDetailState() when $default != null:
return $default(_that.device,_that.ownerName,_that.isSaving,_that.didChange,_that.owners);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceDetailState extends DeviceDetailState {
  const _DeviceDetailState({this.device = const DeviceEntity(), this.ownerName = '', this.isSaving = false, this.didChange = false, final  List<UserEntity> owners = const <UserEntity>[]}): _owners = owners,super._();
  

@override@JsonKey() final  DeviceEntity device;
@override@JsonKey() final  String ownerName;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool didChange;
// Toàn bộ tài khoản (chủ trọ) — để admin chọn khi gán lại thiết bị sang
// chủ khác (owner_picker.dart, giống màn Tạo thiết bị).
 final  List<UserEntity> _owners;
// Toàn bộ tài khoản (chủ trọ) — để admin chọn khi gán lại thiết bị sang
// chủ khác (owner_picker.dart, giống màn Tạo thiết bị).
@override@JsonKey() List<UserEntity> get owners {
  if (_owners is EqualUnmodifiableListView) return _owners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_owners);
}


/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceDetailStateCopyWith<_DeviceDetailState> get copyWith => __$DeviceDetailStateCopyWithImpl<_DeviceDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceDetailState&&(identical(other.device, device) || other.device == device)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.didChange, didChange) || other.didChange == didChange)&&const DeepCollectionEquality().equals(other._owners, _owners));
}


@override
int get hashCode => Object.hash(runtimeType,device,ownerName,isSaving,didChange,const DeepCollectionEquality().hash(_owners));

@override
String toString() {
  return 'DeviceDetailState(device: $device, ownerName: $ownerName, isSaving: $isSaving, didChange: $didChange, owners: $owners)';
}


}

/// @nodoc
abstract mixin class _$DeviceDetailStateCopyWith<$Res> implements $DeviceDetailStateCopyWith<$Res> {
  factory _$DeviceDetailStateCopyWith(_DeviceDetailState value, $Res Function(_DeviceDetailState) _then) = __$DeviceDetailStateCopyWithImpl;
@override @useResult
$Res call({
 DeviceEntity device, String ownerName, bool isSaving, bool didChange, List<UserEntity> owners
});


@override $DeviceEntityCopyWith<$Res> get device;

}
/// @nodoc
class __$DeviceDetailStateCopyWithImpl<$Res>
    implements _$DeviceDetailStateCopyWith<$Res> {
  __$DeviceDetailStateCopyWithImpl(this._self, this._then);

  final _DeviceDetailState _self;
  final $Res Function(_DeviceDetailState) _then;

/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? ownerName = null,Object? isSaving = null,Object? didChange = null,Object? owners = null,}) {
  return _then(_DeviceDetailState(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceEntity,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,didChange: null == didChange ? _self.didChange : didChange // ignore: cast_nullable_to_non_nullable
as bool,owners: null == owners ? _self._owners : owners // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,
  ));
}

/// Create a copy of DeviceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceEntityCopyWith<$Res> get device {
  
  return $DeviceEntityCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

// dart format on
