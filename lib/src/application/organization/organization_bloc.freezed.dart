// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationEvent()';
}


}

/// @nodoc
class $OrganizationEventCopyWith<$Res>  {
$OrganizationEventCopyWith(OrganizationEvent _, $Res Function(OrganizationEvent) __);
}


/// Adds pattern-matching-related methods to [OrganizationEvent].
extension OrganizationEventPatterns on OrganizationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _JoinRequested value)?  joinRequested,TResult Function( _FetchUsers value)?  fetchUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _JoinRequested() when joinRequested != null:
return joinRequested(_that);case _FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _JoinRequested value)  joinRequested,required TResult Function( _FetchUsers value)  fetchUsers,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _JoinRequested():
return joinRequested(_that);case _FetchUsers():
return fetchUsers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _JoinRequested value)?  joinRequested,TResult? Function( _FetchUsers value)?  fetchUsers,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _JoinRequested() when joinRequested != null:
return joinRequested(_that);case _FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  fetch,TResult Function()?  joinRequested,TResult Function()?  fetchUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.email);case _JoinRequested() when joinRequested != null:
return joinRequested();case _FetchUsers() when fetchUsers != null:
return fetchUsers();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  fetch,required TResult Function()  joinRequested,required TResult Function()  fetchUsers,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.email);case _JoinRequested():
return joinRequested();case _FetchUsers():
return fetchUsers();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  fetch,TResult? Function()?  joinRequested,TResult? Function()?  fetchUsers,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.email);case _JoinRequested() when joinRequested != null:
return joinRequested();case _FetchUsers() when fetchUsers != null:
return fetchUsers();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements OrganizationEvent {
  const _Fetch(this.email);
  

 final  String email;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCopyWith<_Fetch> get copyWith => __$FetchCopyWithImpl<_Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'OrganizationEvent.fetch(email: $email)';
}


}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) = __$FetchCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$FetchCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_Fetch(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _JoinRequested implements OrganizationEvent {
  const _JoinRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationEvent.joinRequested()';
}


}




/// @nodoc


class _FetchUsers implements OrganizationEvent {
  const _FetchUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationEvent.fetchUsers()';
}


}




/// @nodoc
mixin _$OrganizationState {

 bool get showErrorMessages; bool get isSubmitting; Option<Either<GlobalFailure, OrganizationSettingsResult>> get failureOrSuccessOption;// Users
 bool get isLoadingUsers; List<OrganizationUser> get users; Option<Either<GlobalFailure, List<OrganizationUser>>> get usersResultOption;
/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationStateCopyWith<OrganizationState> get copyWith => _$OrganizationStateCopyWithImpl<OrganizationState>(this as OrganizationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.usersResultOption, usersResultOption) || other.usersResultOption == usersResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,failureOrSuccessOption,isLoadingUsers,const DeepCollectionEquality().hash(users),usersResultOption);

@override
String toString() {
  return 'OrganizationState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption, isLoadingUsers: $isLoadingUsers, users: $users, usersResultOption: $usersResultOption)';
}


}

/// @nodoc
abstract mixin class $OrganizationStateCopyWith<$Res>  {
  factory $OrganizationStateCopyWith(OrganizationState value, $Res Function(OrganizationState) _then) = _$OrganizationStateCopyWithImpl;
@useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption, bool isLoadingUsers, List<OrganizationUser> users, Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption
});




}
/// @nodoc
class _$OrganizationStateCopyWithImpl<$Res>
    implements $OrganizationStateCopyWith<$Res> {
  _$OrganizationStateCopyWithImpl(this._self, this._then);

  final OrganizationState _self;
  final $Res Function(OrganizationState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? failureOrSuccessOption = null,Object? isLoadingUsers = null,Object? users = null,Object? usersResultOption = null,}) {
  return _then(_self.copyWith(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, OrganizationSettingsResult>>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<OrganizationUser>,usersResultOption: null == usersResultOption ? _self.usersResultOption : usersResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<OrganizationUser>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationState].
extension OrganizationStatePatterns on OrganizationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationState value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationState value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption,  bool isLoadingUsers,  List<OrganizationUser> users,  Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption,_that.isLoadingUsers,_that.users,_that.usersResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption,  bool isLoadingUsers,  List<OrganizationUser> users,  Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption)  $default,) {final _that = this;
switch (_that) {
case _OrganizationState():
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption,_that.isLoadingUsers,_that.users,_that.usersResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption,  bool isLoadingUsers,  List<OrganizationUser> users,  Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption,_that.isLoadingUsers,_that.users,_that.usersResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationState implements OrganizationState {
  const _OrganizationState({required this.showErrorMessages, required this.isSubmitting, required this.failureOrSuccessOption, required this.isLoadingUsers, required final  List<OrganizationUser> users, required this.usersResultOption}): _users = users;
  

@override final  bool showErrorMessages;
@override final  bool isSubmitting;
@override final  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption;
// Users
@override final  bool isLoadingUsers;
 final  List<OrganizationUser> _users;
@override List<OrganizationUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationStateCopyWith<_OrganizationState> get copyWith => __$OrganizationStateCopyWithImpl<_OrganizationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.usersResultOption, usersResultOption) || other.usersResultOption == usersResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,failureOrSuccessOption,isLoadingUsers,const DeepCollectionEquality().hash(_users),usersResultOption);

@override
String toString() {
  return 'OrganizationState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption, isLoadingUsers: $isLoadingUsers, users: $users, usersResultOption: $usersResultOption)';
}


}

/// @nodoc
abstract mixin class _$OrganizationStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory _$OrganizationStateCopyWith(_OrganizationState value, $Res Function(_OrganizationState) _then) = __$OrganizationStateCopyWithImpl;
@override @useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption, bool isLoadingUsers, List<OrganizationUser> users, Option<Either<GlobalFailure, List<OrganizationUser>>> usersResultOption
});




}
/// @nodoc
class __$OrganizationStateCopyWithImpl<$Res>
    implements _$OrganizationStateCopyWith<$Res> {
  __$OrganizationStateCopyWithImpl(this._self, this._then);

  final _OrganizationState _self;
  final $Res Function(_OrganizationState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? failureOrSuccessOption = null,Object? isLoadingUsers = null,Object? users = null,Object? usersResultOption = null,}) {
  return _then(_OrganizationState(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, OrganizationSettingsResult>>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<OrganizationUser>,usersResultOption: null == usersResultOption ? _self.usersResultOption : usersResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<OrganizationUser>>>,
  ));
}


}

// dart format on
