// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticatedUserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedUserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticatedUserEvent()';
}


}

/// @nodoc
class $AuthenticatedUserEventCopyWith<$Res>  {
$AuthenticatedUserEventCopyWith(AuthenticatedUserEvent _, $Res Function(AuthenticatedUserEvent) __);
}


/// Adds pattern-matching-related methods to [AuthenticatedUserEvent].
extension AuthenticatedUserEventPatterns on AuthenticatedUserEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _LogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _LogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _LogoutRequested():
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _LogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,TResult Function()?  reset,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _Reset() when reset != null:
return reset();case _LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,required TResult Function()  reset,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested();case _Reset():
return reset();case _LogoutRequested():
return logoutRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,TResult? Function()?  reset,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _Reset() when reset != null:
return reset();case _LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements AuthenticatedUserEvent {
  const _FetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticatedUserEvent.fetchRequested()';
}


}




/// @nodoc


class _Reset implements AuthenticatedUserEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticatedUserEvent.reset()';
}


}




/// @nodoc


class _LogoutRequested implements AuthenticatedUserEvent {
  const _LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticatedUserEvent.logoutRequested()';
}


}




/// @nodoc
mixin _$AuthenticatedUserState {

 bool get isLoading; AuthenticatedUser? get user; bool? get canLogout; Option<Either<GlobalFailure, AuthenticatedUser>> get resultOption;
/// Create a copy of AuthenticatedUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedUserStateCopyWith<AuthenticatedUserState> get copyWith => _$AuthenticatedUserStateCopyWithImpl<AuthenticatedUserState>(this as AuthenticatedUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedUserState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.canLogout, canLogout) || other.canLogout == canLogout)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user,canLogout,resultOption);

@override
String toString() {
  return 'AuthenticatedUserState(isLoading: $isLoading, user: $user, canLogout: $canLogout, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedUserStateCopyWith<$Res>  {
  factory $AuthenticatedUserStateCopyWith(AuthenticatedUserState value, $Res Function(AuthenticatedUserState) _then) = _$AuthenticatedUserStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, AuthenticatedUser? user, bool? canLogout, Option<Either<GlobalFailure, AuthenticatedUser>> resultOption
});




}
/// @nodoc
class _$AuthenticatedUserStateCopyWithImpl<$Res>
    implements $AuthenticatedUserStateCopyWith<$Res> {
  _$AuthenticatedUserStateCopyWithImpl(this._self, this._then);

  final AuthenticatedUserState _self;
  final $Res Function(AuthenticatedUserState) _then;

/// Create a copy of AuthenticatedUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? user = freezed,Object? canLogout = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthenticatedUser?,canLogout: freezed == canLogout ? _self.canLogout : canLogout // ignore: cast_nullable_to_non_nullable
as bool?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuthenticatedUser>>,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticatedUserState].
extension AuthenticatedUserStatePatterns on AuthenticatedUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticatedUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticatedUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticatedUserState value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticatedUserState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  AuthenticatedUser? user,  bool? canLogout,  Option<Either<GlobalFailure, AuthenticatedUser>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticatedUserState() when $default != null:
return $default(_that.isLoading,_that.user,_that.canLogout,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  AuthenticatedUser? user,  bool? canLogout,  Option<Either<GlobalFailure, AuthenticatedUser>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUserState():
return $default(_that.isLoading,_that.user,_that.canLogout,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  AuthenticatedUser? user,  bool? canLogout,  Option<Either<GlobalFailure, AuthenticatedUser>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedUserState() when $default != null:
return $default(_that.isLoading,_that.user,_that.canLogout,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _AuthenticatedUserState implements AuthenticatedUserState {
  const _AuthenticatedUserState({required this.isLoading, required this.user, this.canLogout, required this.resultOption});
  

@override final  bool isLoading;
@override final  AuthenticatedUser? user;
@override final  bool? canLogout;
@override final  Option<Either<GlobalFailure, AuthenticatedUser>> resultOption;

/// Create a copy of AuthenticatedUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedUserStateCopyWith<_AuthenticatedUserState> get copyWith => __$AuthenticatedUserStateCopyWithImpl<_AuthenticatedUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedUserState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.canLogout, canLogout) || other.canLogout == canLogout)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user,canLogout,resultOption);

@override
String toString() {
  return 'AuthenticatedUserState(isLoading: $isLoading, user: $user, canLogout: $canLogout, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedUserStateCopyWith<$Res> implements $AuthenticatedUserStateCopyWith<$Res> {
  factory _$AuthenticatedUserStateCopyWith(_AuthenticatedUserState value, $Res Function(_AuthenticatedUserState) _then) = __$AuthenticatedUserStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, AuthenticatedUser? user, bool? canLogout, Option<Either<GlobalFailure, AuthenticatedUser>> resultOption
});




}
/// @nodoc
class __$AuthenticatedUserStateCopyWithImpl<$Res>
    implements _$AuthenticatedUserStateCopyWith<$Res> {
  __$AuthenticatedUserStateCopyWithImpl(this._self, this._then);

  final _AuthenticatedUserState _self;
  final $Res Function(_AuthenticatedUserState) _then;

/// Create a copy of AuthenticatedUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? user = freezed,Object? canLogout = freezed,Object? resultOption = null,}) {
  return _then(_AuthenticatedUserState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthenticatedUser?,canLogout: freezed == canLogout ? _self.canLogout : canLogout // ignore: cast_nullable_to_non_nullable
as bool?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuthenticatedUser>>,
  ));
}


}

// dart format on
