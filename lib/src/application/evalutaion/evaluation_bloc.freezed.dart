// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evaluation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EvaluationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvaluationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EvaluationsEvent()';
}


}

/// @nodoc
class $EvaluationsEventCopyWith<$Res>  {
$EvaluationsEventCopyWith(EvaluationsEvent _, $Res Function(EvaluationsEvent) __);
}


/// Adds pattern-matching-related methods to [EvaluationsEvent].
extension EvaluationsEventPatterns on EvaluationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int event)?  fetch,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.event);case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int event)  fetch,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.event);case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int event)?  fetch,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.event);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements EvaluationsEvent {
  const _Fetch({required this.event});
  

 final  int event;

/// Create a copy of EvaluationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCopyWith<_Fetch> get copyWith => __$FetchCopyWithImpl<_Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'EvaluationsEvent.fetch(event: $event)';
}


}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $EvaluationsEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) = __$FetchCopyWithImpl;
@useResult
$Res call({
 int event
});




}
/// @nodoc
class __$FetchCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

/// Create a copy of EvaluationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(_Fetch(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements EvaluationsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EvaluationsEvent.reset()';
}


}




/// @nodoc
mixin _$EvaluationsState {

 bool get isLoading; List<EvaluationItem>? get items; Option<Either<GlobalFailure, List<EvaluationItem>>> get resultOption;
/// Create a copy of EvaluationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvaluationsStateCopyWith<EvaluationsState> get copyWith => _$EvaluationsStateCopyWithImpl<EvaluationsState>(this as EvaluationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvaluationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),resultOption);

@override
String toString() {
  return 'EvaluationsState(isLoading: $isLoading, items: $items, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $EvaluationsStateCopyWith<$Res>  {
  factory $EvaluationsStateCopyWith(EvaluationsState value, $Res Function(EvaluationsState) _then) = _$EvaluationsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<EvaluationItem>? items, Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption
});




}
/// @nodoc
class _$EvaluationsStateCopyWithImpl<$Res>
    implements $EvaluationsStateCopyWith<$Res> {
  _$EvaluationsStateCopyWithImpl(this._self, this._then);

  final EvaluationsState _self;
  final $Res Function(EvaluationsState) _then;

/// Create a copy of EvaluationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EvaluationItem>?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<EvaluationItem>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [EvaluationsState].
extension EvaluationsStatePatterns on EvaluationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvaluationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvaluationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvaluationsState value)  $default,){
final _that = this;
switch (_that) {
case _EvaluationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvaluationsState value)?  $default,){
final _that = this;
switch (_that) {
case _EvaluationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<EvaluationItem>? items,  Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvaluationsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<EvaluationItem>? items,  Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _EvaluationsState():
return $default(_that.isLoading,_that.items,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<EvaluationItem>? items,  Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _EvaluationsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _EvaluationsState implements EvaluationsState {
  const _EvaluationsState({required this.isLoading, required final  List<EvaluationItem>? items, required this.resultOption}): _items = items;
  

@override final  bool isLoading;
 final  List<EvaluationItem>? _items;
@override List<EvaluationItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption;

/// Create a copy of EvaluationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvaluationsStateCopyWith<_EvaluationsState> get copyWith => __$EvaluationsStateCopyWithImpl<_EvaluationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EvaluationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),resultOption);

@override
String toString() {
  return 'EvaluationsState(isLoading: $isLoading, items: $items, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$EvaluationsStateCopyWith<$Res> implements $EvaluationsStateCopyWith<$Res> {
  factory _$EvaluationsStateCopyWith(_EvaluationsState value, $Res Function(_EvaluationsState) _then) = __$EvaluationsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<EvaluationItem>? items, Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption
});




}
/// @nodoc
class __$EvaluationsStateCopyWithImpl<$Res>
    implements _$EvaluationsStateCopyWith<$Res> {
  __$EvaluationsStateCopyWithImpl(this._self, this._then);

  final _EvaluationsState _self;
  final $Res Function(_EvaluationsState) _then;

/// Create a copy of EvaluationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = freezed,Object? resultOption = null,}) {
  return _then(_EvaluationsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EvaluationItem>?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<EvaluationItem>>>,
  ));
}


}

// dart format on
