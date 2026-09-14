// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_manage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserManageState {

 bool get isLoading; bool get hasError; List<UserEntity> get allUsers; List<UserEntity> get users; String get query;
/// Create a copy of UserManageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserManageStateCopyWith<UserManageState> get copyWith => _$UserManageStateCopyWithImpl<UserManageState>(this as UserManageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserManageState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&const DeepCollectionEquality().equals(other.allUsers, allUsers)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,const DeepCollectionEquality().hash(allUsers),const DeepCollectionEquality().hash(users),query);

@override
String toString() {
  return 'UserManageState(isLoading: $isLoading, hasError: $hasError, allUsers: $allUsers, users: $users, query: $query)';
}


}

/// @nodoc
abstract mixin class $UserManageStateCopyWith<$Res>  {
  factory $UserManageStateCopyWith(UserManageState value, $Res Function(UserManageState) _then) = _$UserManageStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasError, List<UserEntity> allUsers, List<UserEntity> users, String query
});




}
/// @nodoc
class _$UserManageStateCopyWithImpl<$Res>
    implements $UserManageStateCopyWith<$Res> {
  _$UserManageStateCopyWithImpl(this._self, this._then);

  final UserManageState _self;
  final $Res Function(UserManageState) _then;

/// Create a copy of UserManageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasError = null,Object? allUsers = null,Object? users = null,Object? query = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,allUsers: null == allUsers ? _self.allUsers : allUsers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserManageState].
extension UserManageStatePatterns on UserManageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserManageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserManageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserManageState value)  $default,){
final _that = this;
switch (_that) {
case _UserManageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserManageState value)?  $default,){
final _that = this;
switch (_that) {
case _UserManageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  List<UserEntity> allUsers,  List<UserEntity> users,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserManageState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.allUsers,_that.users,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  List<UserEntity> allUsers,  List<UserEntity> users,  String query)  $default,) {final _that = this;
switch (_that) {
case _UserManageState():
return $default(_that.isLoading,_that.hasError,_that.allUsers,_that.users,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasError,  List<UserEntity> allUsers,  List<UserEntity> users,  String query)?  $default,) {final _that = this;
switch (_that) {
case _UserManageState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.allUsers,_that.users,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _UserManageState extends UserManageState {
  const _UserManageState({this.isLoading = true, this.hasError = false, final  List<UserEntity> allUsers = const <UserEntity>[], final  List<UserEntity> users = const <UserEntity>[], this.query = ''}): _allUsers = allUsers,_users = users,super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;
 final  List<UserEntity> _allUsers;
@override@JsonKey() List<UserEntity> get allUsers {
  if (_allUsers is EqualUnmodifiableListView) return _allUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allUsers);
}

 final  List<UserEntity> _users;
@override@JsonKey() List<UserEntity> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  String query;

/// Create a copy of UserManageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserManageStateCopyWith<_UserManageState> get copyWith => __$UserManageStateCopyWithImpl<_UserManageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserManageState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&const DeepCollectionEquality().equals(other._allUsers, _allUsers)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,const DeepCollectionEquality().hash(_allUsers),const DeepCollectionEquality().hash(_users),query);

@override
String toString() {
  return 'UserManageState(isLoading: $isLoading, hasError: $hasError, allUsers: $allUsers, users: $users, query: $query)';
}


}

/// @nodoc
abstract mixin class _$UserManageStateCopyWith<$Res> implements $UserManageStateCopyWith<$Res> {
  factory _$UserManageStateCopyWith(_UserManageState value, $Res Function(_UserManageState) _then) = __$UserManageStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasError, List<UserEntity> allUsers, List<UserEntity> users, String query
});




}
/// @nodoc
class __$UserManageStateCopyWithImpl<$Res>
    implements _$UserManageStateCopyWith<$Res> {
  __$UserManageStateCopyWithImpl(this._self, this._then);

  final _UserManageState _self;
  final $Res Function(_UserManageState) _then;

/// Create a copy of UserManageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasError = null,Object? allUsers = null,Object? users = null,Object? query = null,}) {
  return _then(_UserManageState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,allUsers: null == allUsers ? _self._allUsers : allUsers // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
