// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExternalAuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExternalAuthEvent()';
}


}

/// @nodoc
class $ExternalAuthEventCopyWith<$Res>  {
$ExternalAuthEventCopyWith(ExternalAuthEvent _, $Res Function(ExternalAuthEvent) __);
}


/// Adds pattern-matching-related methods to [ExternalAuthEvent].
extension ExternalAuthEventPatterns on ExternalAuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GooglePressed value)?  googlePressed,TResult Function( _LdapPressed value)?  ldapPressed,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GooglePressed() when googlePressed != null:
return googlePressed(_that);case _LdapPressed() when ldapPressed != null:
return ldapPressed(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GooglePressed value)  googlePressed,required TResult Function( _LdapPressed value)  ldapPressed,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _GooglePressed():
return googlePressed(_that);case _LdapPressed():
return ldapPressed(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GooglePressed value)?  googlePressed,TResult? Function( _LdapPressed value)?  ldapPressed,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _GooglePressed() when googlePressed != null:
return googlePressed(_that);case _LdapPressed() when ldapPressed != null:
return ldapPressed(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  googlePressed,TResult Function()?  ldapPressed,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GooglePressed() when googlePressed != null:
return googlePressed();case _LdapPressed() when ldapPressed != null:
return ldapPressed();case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  googlePressed,required TResult Function()  ldapPressed,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _GooglePressed():
return googlePressed();case _LdapPressed():
return ldapPressed();case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  googlePressed,TResult? Function()?  ldapPressed,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _GooglePressed() when googlePressed != null:
return googlePressed();case _LdapPressed() when ldapPressed != null:
return ldapPressed();case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _GooglePressed implements ExternalAuthEvent {
  const _GooglePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GooglePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExternalAuthEvent.googlePressed()';
}


}




/// @nodoc


class _LdapPressed implements ExternalAuthEvent {
  const _LdapPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LdapPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExternalAuthEvent.ldapPressed()';
}


}




/// @nodoc


class _Reset implements ExternalAuthEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExternalAuthEvent.reset()';
}


}




/// @nodoc
mixin _$ExternalAuthState {

 bool get isSubmitting; Option<Either<GlobalFailure, String>> get resultOption;
/// Create a copy of ExternalAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExternalAuthStateCopyWith<ExternalAuthState> get copyWith => _$ExternalAuthStateCopyWithImpl<ExternalAuthState>(this as ExternalAuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalAuthState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,resultOption);

@override
String toString() {
  return 'ExternalAuthState(isSubmitting: $isSubmitting, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $ExternalAuthStateCopyWith<$Res>  {
  factory $ExternalAuthStateCopyWith(ExternalAuthState value, $Res Function(ExternalAuthState) _then) = _$ExternalAuthStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, Option<Either<GlobalFailure, String>> resultOption
});




}
/// @nodoc
class _$ExternalAuthStateCopyWithImpl<$Res>
    implements $ExternalAuthStateCopyWith<$Res> {
  _$ExternalAuthStateCopyWithImpl(this._self, this._then);

  final ExternalAuthState _self;
  final $Res Function(ExternalAuthState) _then;

/// Create a copy of ExternalAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExternalAuthState].
extension ExternalAuthStatePatterns on ExternalAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExternalAuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExternalAuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExternalAuthState value)  $default,){
final _that = this;
switch (_that) {
case _ExternalAuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExternalAuthState value)?  $default,){
final _that = this;
switch (_that) {
case _ExternalAuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  Option<Either<GlobalFailure, String>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExternalAuthState() when $default != null:
return $default(_that.isSubmitting,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  Option<Either<GlobalFailure, String>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _ExternalAuthState():
return $default(_that.isSubmitting,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  Option<Either<GlobalFailure, String>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _ExternalAuthState() when $default != null:
return $default(_that.isSubmitting,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _ExternalAuthState implements ExternalAuthState {
  const _ExternalAuthState({required this.isSubmitting, required this.resultOption});
  

@override final  bool isSubmitting;
@override final  Option<Either<GlobalFailure, String>> resultOption;

/// Create a copy of ExternalAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExternalAuthStateCopyWith<_ExternalAuthState> get copyWith => __$ExternalAuthStateCopyWithImpl<_ExternalAuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExternalAuthState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,resultOption);

@override
String toString() {
  return 'ExternalAuthState(isSubmitting: $isSubmitting, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$ExternalAuthStateCopyWith<$Res> implements $ExternalAuthStateCopyWith<$Res> {
  factory _$ExternalAuthStateCopyWith(_ExternalAuthState value, $Res Function(_ExternalAuthState) _then) = __$ExternalAuthStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, Option<Either<GlobalFailure, String>> resultOption
});




}
/// @nodoc
class __$ExternalAuthStateCopyWithImpl<$Res>
    implements _$ExternalAuthStateCopyWith<$Res> {
  __$ExternalAuthStateCopyWithImpl(this._self, this._then);

  final _ExternalAuthState _self;
  final $Res Function(_ExternalAuthState) _then;

/// Create a copy of ExternalAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? resultOption = null,}) {
  return _then(_ExternalAuthState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, String>>,
  ));
}


}

// dart format on
