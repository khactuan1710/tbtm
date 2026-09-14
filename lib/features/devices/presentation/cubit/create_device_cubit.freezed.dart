// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_device_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateDeviceState {

 List<UserEntity> get owners; UserEntity? get selectedOwner; List<ServiceEntity> get services; bool get isSubmitting; bool get didCreate;
/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDeviceStateCopyWith<CreateDeviceState> get copyWith => _$CreateDeviceStateCopyWithImpl<CreateDeviceState>(this as CreateDeviceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDeviceState&&const DeepCollectionEquality().equals(other.owners, owners)&&(identical(other.selectedOwner, selectedOwner) || other.selectedOwner == selectedOwner)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.didCreate, didCreate) || other.didCreate == didCreate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(owners),selectedOwner,const DeepCollectionEquality().hash(services),isSubmitting,didCreate);

@override
String toString() {
  return 'CreateDeviceState(owners: $owners, selectedOwner: $selectedOwner, services: $services, isSubmitting: $isSubmitting, didCreate: $didCreate)';
}


}

/// @nodoc
abstract mixin class $CreateDeviceStateCopyWith<$Res>  {
  factory $CreateDeviceStateCopyWith(CreateDeviceState value, $Res Function(CreateDeviceState) _then) = _$CreateDeviceStateCopyWithImpl;
@useResult
$Res call({
 List<UserEntity> owners, UserEntity? selectedOwner, List<ServiceEntity> services, bool isSubmitting, bool didCreate
});


$UserEntityCopyWith<$Res>? get selectedOwner;

}
/// @nodoc
class _$CreateDeviceStateCopyWithImpl<$Res>
    implements $CreateDeviceStateCopyWith<$Res> {
  _$CreateDeviceStateCopyWithImpl(this._self, this._then);

  final CreateDeviceState _self;
  final $Res Function(CreateDeviceState) _then;

/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? owners = null,Object? selectedOwner = freezed,Object? services = null,Object? isSubmitting = null,Object? didCreate = null,}) {
  return _then(_self.copyWith(
owners: null == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedOwner: freezed == selectedOwner ? _self.selectedOwner : selectedOwner // ignore: cast_nullable_to_non_nullable
as UserEntity?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,didCreate: null == didCreate ? _self.didCreate : didCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get selectedOwner {
    if (_self.selectedOwner == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.selectedOwner!, (value) {
    return _then(_self.copyWith(selectedOwner: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateDeviceState].
extension CreateDeviceStatePatterns on CreateDeviceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDeviceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDeviceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDeviceState value)  $default,){
final _that = this;
switch (_that) {
case _CreateDeviceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDeviceState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDeviceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserEntity> owners,  UserEntity? selectedOwner,  List<ServiceEntity> services,  bool isSubmitting,  bool didCreate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDeviceState() when $default != null:
return $default(_that.owners,_that.selectedOwner,_that.services,_that.isSubmitting,_that.didCreate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserEntity> owners,  UserEntity? selectedOwner,  List<ServiceEntity> services,  bool isSubmitting,  bool didCreate)  $default,) {final _that = this;
switch (_that) {
case _CreateDeviceState():
return $default(_that.owners,_that.selectedOwner,_that.services,_that.isSubmitting,_that.didCreate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserEntity> owners,  UserEntity? selectedOwner,  List<ServiceEntity> services,  bool isSubmitting,  bool didCreate)?  $default,) {final _that = this;
switch (_that) {
case _CreateDeviceState() when $default != null:
return $default(_that.owners,_that.selectedOwner,_that.services,_that.isSubmitting,_that.didCreate);case _:
  return null;

}
}

}

/// @nodoc


class _CreateDeviceState extends CreateDeviceState {
  const _CreateDeviceState({final  List<UserEntity> owners = const <UserEntity>[], this.selectedOwner, final  List<ServiceEntity> services = const <ServiceEntity>[], this.isSubmitting = false, this.didCreate = false}): _owners = owners,_services = services,super._();
  

 final  List<UserEntity> _owners;
@override@JsonKey() List<UserEntity> get owners {
  if (_owners is EqualUnmodifiableListView) return _owners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_owners);
}

@override final  UserEntity? selectedOwner;
 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool didCreate;

/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDeviceStateCopyWith<_CreateDeviceState> get copyWith => __$CreateDeviceStateCopyWithImpl<_CreateDeviceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDeviceState&&const DeepCollectionEquality().equals(other._owners, _owners)&&(identical(other.selectedOwner, selectedOwner) || other.selectedOwner == selectedOwner)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.didCreate, didCreate) || other.didCreate == didCreate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_owners),selectedOwner,const DeepCollectionEquality().hash(_services),isSubmitting,didCreate);

@override
String toString() {
  return 'CreateDeviceState(owners: $owners, selectedOwner: $selectedOwner, services: $services, isSubmitting: $isSubmitting, didCreate: $didCreate)';
}


}

/// @nodoc
abstract mixin class _$CreateDeviceStateCopyWith<$Res> implements $CreateDeviceStateCopyWith<$Res> {
  factory _$CreateDeviceStateCopyWith(_CreateDeviceState value, $Res Function(_CreateDeviceState) _then) = __$CreateDeviceStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserEntity> owners, UserEntity? selectedOwner, List<ServiceEntity> services, bool isSubmitting, bool didCreate
});


@override $UserEntityCopyWith<$Res>? get selectedOwner;

}
/// @nodoc
class __$CreateDeviceStateCopyWithImpl<$Res>
    implements _$CreateDeviceStateCopyWith<$Res> {
  __$CreateDeviceStateCopyWithImpl(this._self, this._then);

  final _CreateDeviceState _self;
  final $Res Function(_CreateDeviceState) _then;

/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? owners = null,Object? selectedOwner = freezed,Object? services = null,Object? isSubmitting = null,Object? didCreate = null,}) {
  return _then(_CreateDeviceState(
owners: null == owners ? _self._owners : owners // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,selectedOwner: freezed == selectedOwner ? _self.selectedOwner : selectedOwner // ignore: cast_nullable_to_non_nullable
as UserEntity?,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,didCreate: null == didCreate ? _self.didCreate : didCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CreateDeviceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get selectedOwner {
    if (_self.selectedOwner == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.selectedOwner!, (value) {
    return _then(_self.copyWith(selectedOwner: value));
  });
}
}

// dart format on
