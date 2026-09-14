// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAccountState {

 List<BankCodeEntity> get bankCodes; BankCodeEntity? get selectedBank; String get type; bool get isSubmitting; bool get didCreate;
/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountStateCopyWith<CreateAccountState> get copyWith => _$CreateAccountStateCopyWithImpl<CreateAccountState>(this as CreateAccountState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountState&&const DeepCollectionEquality().equals(other.bankCodes, bankCodes)&&(identical(other.selectedBank, selectedBank) || other.selectedBank == selectedBank)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.didCreate, didCreate) || other.didCreate == didCreate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bankCodes),selectedBank,type,isSubmitting,didCreate);

@override
String toString() {
  return 'CreateAccountState(bankCodes: $bankCodes, selectedBank: $selectedBank, type: $type, isSubmitting: $isSubmitting, didCreate: $didCreate)';
}


}

/// @nodoc
abstract mixin class $CreateAccountStateCopyWith<$Res>  {
  factory $CreateAccountStateCopyWith(CreateAccountState value, $Res Function(CreateAccountState) _then) = _$CreateAccountStateCopyWithImpl;
@useResult
$Res call({
 List<BankCodeEntity> bankCodes, BankCodeEntity? selectedBank, String type, bool isSubmitting, bool didCreate
});


$BankCodeEntityCopyWith<$Res>? get selectedBank;

}
/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._self, this._then);

  final CreateAccountState _self;
  final $Res Function(CreateAccountState) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bankCodes = null,Object? selectedBank = freezed,Object? type = null,Object? isSubmitting = null,Object? didCreate = null,}) {
  return _then(_self.copyWith(
bankCodes: null == bankCodes ? _self.bankCodes : bankCodes // ignore: cast_nullable_to_non_nullable
as List<BankCodeEntity>,selectedBank: freezed == selectedBank ? _self.selectedBank : selectedBank // ignore: cast_nullable_to_non_nullable
as BankCodeEntity?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,didCreate: null == didCreate ? _self.didCreate : didCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankCodeEntityCopyWith<$Res>? get selectedBank {
    if (_self.selectedBank == null) {
    return null;
  }

  return $BankCodeEntityCopyWith<$Res>(_self.selectedBank!, (value) {
    return _then(_self.copyWith(selectedBank: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateAccountState].
extension CreateAccountStatePatterns on CreateAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAccountState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAccountState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAccountState value)  $default,){
final _that = this;
switch (_that) {
case _CreateAccountState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAccountState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAccountState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BankCodeEntity> bankCodes,  BankCodeEntity? selectedBank,  String type,  bool isSubmitting,  bool didCreate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAccountState() when $default != null:
return $default(_that.bankCodes,_that.selectedBank,_that.type,_that.isSubmitting,_that.didCreate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BankCodeEntity> bankCodes,  BankCodeEntity? selectedBank,  String type,  bool isSubmitting,  bool didCreate)  $default,) {final _that = this;
switch (_that) {
case _CreateAccountState():
return $default(_that.bankCodes,_that.selectedBank,_that.type,_that.isSubmitting,_that.didCreate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BankCodeEntity> bankCodes,  BankCodeEntity? selectedBank,  String type,  bool isSubmitting,  bool didCreate)?  $default,) {final _that = this;
switch (_that) {
case _CreateAccountState() when $default != null:
return $default(_that.bankCodes,_that.selectedBank,_that.type,_that.isSubmitting,_that.didCreate);case _:
  return null;

}
}

}

/// @nodoc


class _CreateAccountState extends CreateAccountState {
  const _CreateAccountState({final  List<BankCodeEntity> bankCodes = const <BankCodeEntity>[], this.selectedBank, this.type = 'user', this.isSubmitting = false, this.didCreate = false}): _bankCodes = bankCodes,super._();
  

 final  List<BankCodeEntity> _bankCodes;
@override@JsonKey() List<BankCodeEntity> get bankCodes {
  if (_bankCodes is EqualUnmodifiableListView) return _bankCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bankCodes);
}

@override final  BankCodeEntity? selectedBank;
@override@JsonKey() final  String type;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool didCreate;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAccountStateCopyWith<_CreateAccountState> get copyWith => __$CreateAccountStateCopyWithImpl<_CreateAccountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAccountState&&const DeepCollectionEquality().equals(other._bankCodes, _bankCodes)&&(identical(other.selectedBank, selectedBank) || other.selectedBank == selectedBank)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.didCreate, didCreate) || other.didCreate == didCreate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bankCodes),selectedBank,type,isSubmitting,didCreate);

@override
String toString() {
  return 'CreateAccountState(bankCodes: $bankCodes, selectedBank: $selectedBank, type: $type, isSubmitting: $isSubmitting, didCreate: $didCreate)';
}


}

/// @nodoc
abstract mixin class _$CreateAccountStateCopyWith<$Res> implements $CreateAccountStateCopyWith<$Res> {
  factory _$CreateAccountStateCopyWith(_CreateAccountState value, $Res Function(_CreateAccountState) _then) = __$CreateAccountStateCopyWithImpl;
@override @useResult
$Res call({
 List<BankCodeEntity> bankCodes, BankCodeEntity? selectedBank, String type, bool isSubmitting, bool didCreate
});


@override $BankCodeEntityCopyWith<$Res>? get selectedBank;

}
/// @nodoc
class __$CreateAccountStateCopyWithImpl<$Res>
    implements _$CreateAccountStateCopyWith<$Res> {
  __$CreateAccountStateCopyWithImpl(this._self, this._then);

  final _CreateAccountState _self;
  final $Res Function(_CreateAccountState) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bankCodes = null,Object? selectedBank = freezed,Object? type = null,Object? isSubmitting = null,Object? didCreate = null,}) {
  return _then(_CreateAccountState(
bankCodes: null == bankCodes ? _self._bankCodes : bankCodes // ignore: cast_nullable_to_non_nullable
as List<BankCodeEntity>,selectedBank: freezed == selectedBank ? _self.selectedBank : selectedBank // ignore: cast_nullable_to_non_nullable
as BankCodeEntity?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,didCreate: null == didCreate ? _self.didCreate : didCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankCodeEntityCopyWith<$Res>? get selectedBank {
    if (_self.selectedBank == null) {
    return null;
  }

  return $BankCodeEntityCopyWith<$Res>(_self.selectedBank!, (value) {
    return _then(_self.copyWith(selectedBank: value));
  });
}
}

// dart format on
