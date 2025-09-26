// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionsEvent()';
}


}

/// @nodoc
class $ActionsEventCopyWith<$Res>  {
$ActionsEventCopyWith(ActionsEvent _, $Res Function(ActionsEvent) __);
}


/// Adds pattern-matching-related methods to [ActionsEvent].
extension ActionsEventPatterns on ActionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _Reset value)?  reset,TResult Function( _FetchByOrigin value)?  fetchByOrigin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
return reset(_that);case _FetchByOrigin() when fetchByOrigin != null:
return fetchByOrigin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _Reset value)  reset,required TResult Function( _FetchByOrigin value)  fetchByOrigin,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _Reset():
return reset(_that);case _FetchByOrigin():
return fetchByOrigin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _Reset value)?  reset,TResult? Function( _FetchByOrigin value)?  fetchByOrigin,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
return reset(_that);case _FetchByOrigin() when fetchByOrigin != null:
return fetchByOrigin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function()?  reset,TResult Function( String originType,  int originId)?  fetchByOrigin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _Reset() when reset != null:
return reset();case _FetchByOrigin() when fetchByOrigin != null:
return fetchByOrigin(_that.originType,_that.originId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function()  reset,required TResult Function( String originType,  int originId)  fetchByOrigin,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch();case _Reset():
return reset();case _FetchByOrigin():
return fetchByOrigin(_that.originType,_that.originId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function()?  reset,TResult? Function( String originType,  int originId)?  fetchByOrigin,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _Reset() when reset != null:
return reset();case _FetchByOrigin() when fetchByOrigin != null:
return fetchByOrigin(_that.originType,_that.originId);case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements ActionsEvent {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionsEvent.fetch()';
}


}




/// @nodoc


class _Reset implements ActionsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionsEvent.reset()';
}


}




/// @nodoc


class _FetchByOrigin implements ActionsEvent {
  const _FetchByOrigin({required this.originType, required this.originId});
  

 final  String originType;
 final  int originId;

/// Create a copy of ActionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchByOriginCopyWith<_FetchByOrigin> get copyWith => __$FetchByOriginCopyWithImpl<_FetchByOrigin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchByOrigin&&(identical(other.originType, originType) || other.originType == originType)&&(identical(other.originId, originId) || other.originId == originId));
}


@override
int get hashCode => Object.hash(runtimeType,originType,originId);

@override
String toString() {
  return 'ActionsEvent.fetchByOrigin(originType: $originType, originId: $originId)';
}


}

/// @nodoc
abstract mixin class _$FetchByOriginCopyWith<$Res> implements $ActionsEventCopyWith<$Res> {
  factory _$FetchByOriginCopyWith(_FetchByOrigin value, $Res Function(_FetchByOrigin) _then) = __$FetchByOriginCopyWithImpl;
@useResult
$Res call({
 String originType, int originId
});




}
/// @nodoc
class __$FetchByOriginCopyWithImpl<$Res>
    implements _$FetchByOriginCopyWith<$Res> {
  __$FetchByOriginCopyWithImpl(this._self, this._then);

  final _FetchByOrigin _self;
  final $Res Function(_FetchByOrigin) _then;

/// Create a copy of ActionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originType = null,Object? originId = null,}) {
  return _then(_FetchByOrigin(
originType: null == originType ? _self.originType : originType // ignore: cast_nullable_to_non_nullable
as String,originId: null == originId ? _self.originId : originId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ActionsState {

 bool get isLoading; List<ActionItem>? get items; List<ActionItem>? get originItems; Option<Either<GlobalFailure, List<ActionItem>>> get resultOption;
/// Create a copy of ActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionsStateCopyWith<ActionsState> get copyWith => _$ActionsStateCopyWithImpl<ActionsState>(this as ActionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.originItems, originItems)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(originItems),resultOption);

@override
String toString() {
  return 'ActionsState(isLoading: $isLoading, items: $items, originItems: $originItems, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $ActionsStateCopyWith<$Res>  {
  factory $ActionsStateCopyWith(ActionsState value, $Res Function(ActionsState) _then) = _$ActionsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<ActionItem>? items, List<ActionItem>? originItems, Option<Either<GlobalFailure, List<ActionItem>>> resultOption
});




}
/// @nodoc
class _$ActionsStateCopyWithImpl<$Res>
    implements $ActionsStateCopyWith<$Res> {
  _$ActionsStateCopyWithImpl(this._self, this._then);

  final ActionsState _self;
  final $Res Function(ActionsState) _then;

/// Create a copy of ActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = freezed,Object? originItems = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ActionItem>?,originItems: freezed == originItems ? _self.originItems : originItems // ignore: cast_nullable_to_non_nullable
as List<ActionItem>?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<ActionItem>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionsState].
extension ActionsStatePatterns on ActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionsState value)  $default,){
final _that = this;
switch (_that) {
case _ActionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ActionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<ActionItem>? items,  List<ActionItem>? originItems,  Option<Either<GlobalFailure, List<ActionItem>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.originItems,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<ActionItem>? items,  List<ActionItem>? originItems,  Option<Either<GlobalFailure, List<ActionItem>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _ActionsState():
return $default(_that.isLoading,_that.items,_that.originItems,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<ActionItem>? items,  List<ActionItem>? originItems,  Option<Either<GlobalFailure, List<ActionItem>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _ActionsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.originItems,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _ActionsState implements ActionsState {
  const _ActionsState({required this.isLoading, required final  List<ActionItem>? items, required final  List<ActionItem>? originItems, required this.resultOption}): _items = items,_originItems = originItems;
  

@override final  bool isLoading;
 final  List<ActionItem>? _items;
@override List<ActionItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ActionItem>? _originItems;
@override List<ActionItem>? get originItems {
  final value = _originItems;
  if (value == null) return null;
  if (_originItems is EqualUnmodifiableListView) return _originItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Option<Either<GlobalFailure, List<ActionItem>>> resultOption;

/// Create a copy of ActionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionsStateCopyWith<_ActionsState> get copyWith => __$ActionsStateCopyWithImpl<_ActionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._originItems, _originItems)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_originItems),resultOption);

@override
String toString() {
  return 'ActionsState(isLoading: $isLoading, items: $items, originItems: $originItems, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$ActionsStateCopyWith<$Res> implements $ActionsStateCopyWith<$Res> {
  factory _$ActionsStateCopyWith(_ActionsState value, $Res Function(_ActionsState) _then) = __$ActionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<ActionItem>? items, List<ActionItem>? originItems, Option<Either<GlobalFailure, List<ActionItem>>> resultOption
});




}
/// @nodoc
class __$ActionsStateCopyWithImpl<$Res>
    implements _$ActionsStateCopyWith<$Res> {
  __$ActionsStateCopyWithImpl(this._self, this._then);

  final _ActionsState _self;
  final $Res Function(_ActionsState) _then;

/// Create a copy of ActionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = freezed,Object? originItems = freezed,Object? resultOption = null,}) {
  return _then(_ActionsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ActionItem>?,originItems: freezed == originItems ? _self._originItems : originItems // ignore: cast_nullable_to_non_nullable
as List<ActionItem>?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<ActionItem>>>,
  ));
}


}

// dart format on
