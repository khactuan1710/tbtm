// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get id; String get username; String get fullName; String get phoneNumber; String get address; String get type; bool get isActive; List<String> get addressNew; String get bankCode; String get bankAccountNumber; String get bankAccountName;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.addressNew, addressNew)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountName, bankAccountName) || other.bankAccountName == bankAccountName));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName,phoneNumber,address,type,isActive,const DeepCollectionEquality().hash(addressNew),bankCode,bankAccountNumber,bankAccountName);

@override
String toString() {
  return 'UserEntity(id: $id, username: $username, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, type: $type, isActive: $isActive, addressNew: $addressNew, bankCode: $bankCode, bankAccountNumber: $bankAccountNumber, bankAccountName: $bankAccountName)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String username, String fullName, String phoneNumber, String address, String type, bool isActive, List<String> addressNew, String bankCode, String bankAccountNumber, String bankAccountName
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? phoneNumber = null,Object? address = null,Object? type = null,Object? isActive = null,Object? addressNew = null,Object? bankCode = null,Object? bankAccountNumber = null,Object? bankAccountName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,addressNew: null == addressNew ? _self.addressNew : addressNew // ignore: cast_nullable_to_non_nullable
as List<String>,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountName: null == bankAccountName ? _self.bankAccountName : bankAccountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String fullName,  String phoneNumber,  String address,  String type,  bool isActive,  List<String> addressNew,  String bankCode,  String bankAccountNumber,  String bankAccountName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.phoneNumber,_that.address,_that.type,_that.isActive,_that.addressNew,_that.bankCode,_that.bankAccountNumber,_that.bankAccountName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String fullName,  String phoneNumber,  String address,  String type,  bool isActive,  List<String> addressNew,  String bankCode,  String bankAccountNumber,  String bankAccountName)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.username,_that.fullName,_that.phoneNumber,_that.address,_that.type,_that.isActive,_that.addressNew,_that.bankCode,_that.bankAccountNumber,_that.bankAccountName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String fullName,  String phoneNumber,  String address,  String type,  bool isActive,  List<String> addressNew,  String bankCode,  String bankAccountNumber,  String bankAccountName)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.phoneNumber,_that.address,_that.type,_that.isActive,_that.addressNew,_that.bankCode,_that.bankAccountNumber,_that.bankAccountName);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity extends UserEntity {
  const _UserEntity({this.id = '', this.username = '', this.fullName = '', this.phoneNumber = '', this.address = '', this.type = '', this.isActive = true, final  List<String> addressNew = const <String>[], this.bankCode = '', this.bankAccountNumber = '', this.bankAccountName = ''}): _addressNew = addressNew,super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String username;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String address;
@override@JsonKey() final  String type;
@override@JsonKey() final  bool isActive;
 final  List<String> _addressNew;
@override@JsonKey() List<String> get addressNew {
  if (_addressNew is EqualUnmodifiableListView) return _addressNew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addressNew);
}

@override@JsonKey() final  String bankCode;
@override@JsonKey() final  String bankAccountNumber;
@override@JsonKey() final  String bankAccountName;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._addressNew, _addressNew)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountName, bankAccountName) || other.bankAccountName == bankAccountName));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName,phoneNumber,address,type,isActive,const DeepCollectionEquality().hash(_addressNew),bankCode,bankAccountNumber,bankAccountName);

@override
String toString() {
  return 'UserEntity(id: $id, username: $username, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, type: $type, isActive: $isActive, addressNew: $addressNew, bankCode: $bankCode, bankAccountNumber: $bankAccountNumber, bankAccountName: $bankAccountName)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String fullName, String phoneNumber, String address, String type, bool isActive, List<String> addressNew, String bankCode, String bankAccountNumber, String bankAccountName
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? phoneNumber = null,Object? address = null,Object? type = null,Object? isActive = null,Object? addressNew = null,Object? bankCode = null,Object? bankAccountNumber = null,Object? bankAccountName = null,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,addressNew: null == addressNew ? _self._addressNew : addressNew // ignore: cast_nullable_to_non_nullable
as List<String>,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountName: null == bankAccountName ? _self.bankAccountName : bankAccountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
