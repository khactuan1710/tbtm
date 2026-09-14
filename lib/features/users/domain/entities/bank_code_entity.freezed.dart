// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BankCodeEntity {

 String get bin; String get code; String get name; String get shortName; String get logo;
/// Create a copy of BankCodeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCodeEntityCopyWith<BankCodeEntity> get copyWith => _$BankCodeEntityCopyWithImpl<BankCodeEntity>(this as BankCodeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCodeEntity&&(identical(other.bin, bin) || other.bin == bin)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.logo, logo) || other.logo == logo));
}


@override
int get hashCode => Object.hash(runtimeType,bin,code,name,shortName,logo);

@override
String toString() {
  return 'BankCodeEntity(bin: $bin, code: $code, name: $name, shortName: $shortName, logo: $logo)';
}


}

/// @nodoc
abstract mixin class $BankCodeEntityCopyWith<$Res>  {
  factory $BankCodeEntityCopyWith(BankCodeEntity value, $Res Function(BankCodeEntity) _then) = _$BankCodeEntityCopyWithImpl;
@useResult
$Res call({
 String bin, String code, String name, String shortName, String logo
});




}
/// @nodoc
class _$BankCodeEntityCopyWithImpl<$Res>
    implements $BankCodeEntityCopyWith<$Res> {
  _$BankCodeEntityCopyWithImpl(this._self, this._then);

  final BankCodeEntity _self;
  final $Res Function(BankCodeEntity) _then;

/// Create a copy of BankCodeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bin = null,Object? code = null,Object? name = null,Object? shortName = null,Object? logo = null,}) {
  return _then(_self.copyWith(
bin: null == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCodeEntity].
extension BankCodeEntityPatterns on BankCodeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCodeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCodeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCodeEntity value)  $default,){
final _that = this;
switch (_that) {
case _BankCodeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCodeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BankCodeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bin,  String code,  String name,  String shortName,  String logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCodeEntity() when $default != null:
return $default(_that.bin,_that.code,_that.name,_that.shortName,_that.logo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bin,  String code,  String name,  String shortName,  String logo)  $default,) {final _that = this;
switch (_that) {
case _BankCodeEntity():
return $default(_that.bin,_that.code,_that.name,_that.shortName,_that.logo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bin,  String code,  String name,  String shortName,  String logo)?  $default,) {final _that = this;
switch (_that) {
case _BankCodeEntity() when $default != null:
return $default(_that.bin,_that.code,_that.name,_that.shortName,_that.logo);case _:
  return null;

}
}

}

/// @nodoc


class _BankCodeEntity extends BankCodeEntity {
  const _BankCodeEntity({this.bin = '', this.code = '', this.name = '', this.shortName = '', this.logo = ''}): super._();
  

@override@JsonKey() final  String bin;
@override@JsonKey() final  String code;
@override@JsonKey() final  String name;
@override@JsonKey() final  String shortName;
@override@JsonKey() final  String logo;

/// Create a copy of BankCodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCodeEntityCopyWith<_BankCodeEntity> get copyWith => __$BankCodeEntityCopyWithImpl<_BankCodeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCodeEntity&&(identical(other.bin, bin) || other.bin == bin)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.logo, logo) || other.logo == logo));
}


@override
int get hashCode => Object.hash(runtimeType,bin,code,name,shortName,logo);

@override
String toString() {
  return 'BankCodeEntity(bin: $bin, code: $code, name: $name, shortName: $shortName, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$BankCodeEntityCopyWith<$Res> implements $BankCodeEntityCopyWith<$Res> {
  factory _$BankCodeEntityCopyWith(_BankCodeEntity value, $Res Function(_BankCodeEntity) _then) = __$BankCodeEntityCopyWithImpl;
@override @useResult
$Res call({
 String bin, String code, String name, String shortName, String logo
});




}
/// @nodoc
class __$BankCodeEntityCopyWithImpl<$Res>
    implements _$BankCodeEntityCopyWith<$Res> {
  __$BankCodeEntityCopyWithImpl(this._self, this._then);

  final _BankCodeEntity _self;
  final $Res Function(_BankCodeEntity) _then;

/// Create a copy of BankCodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bin = null,Object? code = null,Object? name = null,Object? shortName = null,Object? logo = null,}) {
  return _then(_BankCodeEntity(
bin: null == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
