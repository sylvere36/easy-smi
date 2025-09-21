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

 String get email;
/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationEventCopyWith<OrganizationEvent> get copyWith => _$OrganizationEventCopyWithImpl<OrganizationEvent>(this as OrganizationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'OrganizationEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $OrganizationEventCopyWith<$Res>  {
  factory $OrganizationEventCopyWith(OrganizationEvent value, $Res Function(OrganizationEvent) _then) = _$OrganizationEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$OrganizationEventCopyWithImpl<$Res>
    implements $OrganizationEventCopyWith<$Res> {
  _$OrganizationEventCopyWithImpl(this._self, this._then);

  final OrganizationEvent _self;
  final $Res Function(OrganizationEvent) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  fetch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  fetch,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  fetch,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements OrganizationEvent {
  const _Fetch(this.email);
  

@override final  String email;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_Fetch(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OrganizationState {

 bool get showErrorMessages; bool get isSubmitting; Option<Either<GlobalFailure, OrganizationSettingsResult>> get failureOrSuccessOption;
/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationStateCopyWith<OrganizationState> get copyWith => _$OrganizationStateCopyWithImpl<OrganizationState>(this as OrganizationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,failureOrSuccessOption);

@override
String toString() {
  return 'OrganizationState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $OrganizationStateCopyWith<$Res>  {
  factory $OrganizationStateCopyWith(OrganizationState value, $Res Function(OrganizationState) _then) = _$OrganizationStateCopyWithImpl;
@useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption
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
@pragma('vm:prefer-inline') @override $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? failureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, OrganizationSettingsResult>>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption)  $default,) {final _that = this;
switch (_that) {
case _OrganizationState():
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showErrorMessages,  bool isSubmitting,  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.showErrorMessages,_that.isSubmitting,_that.failureOrSuccessOption);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationState implements OrganizationState {
  const _OrganizationState({required this.showErrorMessages, required this.isSubmitting, required this.failureOrSuccessOption});
  

@override final  bool showErrorMessages;
@override final  bool isSubmitting;
@override final  Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationStateCopyWith<_OrganizationState> get copyWith => __$OrganizationStateCopyWithImpl<_OrganizationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,failureOrSuccessOption);

@override
String toString() {
  return 'OrganizationState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$OrganizationStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory _$OrganizationStateCopyWith(_OrganizationState value, $Res Function(_OrganizationState) _then) = __$OrganizationStateCopyWithImpl;
@override @useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, Option<Either<GlobalFailure, OrganizationSettingsResult>> failureOrSuccessOption
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
@override @pragma('vm:prefer-inline') $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? failureOrSuccessOption = null,}) {
  return _then(_OrganizationState(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, OrganizationSettingsResult>>,
  ));
}


}

// dart format on
