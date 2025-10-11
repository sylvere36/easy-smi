// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sliders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SlidersEvent {

 int? get page;
/// Create a copy of SlidersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlidersEventCopyWith<SlidersEvent> get copyWith => _$SlidersEventCopyWithImpl<SlidersEvent>(this as SlidersEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlidersEvent&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'SlidersEvent(page: $page)';
}


}

/// @nodoc
abstract mixin class $SlidersEventCopyWith<$Res>  {
  factory $SlidersEventCopyWith(SlidersEvent value, $Res Function(SlidersEvent) _then) = _$SlidersEventCopyWithImpl;
@useResult
$Res call({
 int? page
});




}
/// @nodoc
class _$SlidersEventCopyWithImpl<$Res>
    implements $SlidersEventCopyWith<$Res> {
  _$SlidersEventCopyWithImpl(this._self, this._then);

  final SlidersEvent _self;
  final $Res Function(SlidersEvent) _then;

/// Create a copy of SlidersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SlidersEvent].
extension SlidersEventPatterns on SlidersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? page)?  fetchRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? page)  fetchRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? page)?  fetchRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements SlidersEvent {
  const _FetchRequested({this.page});
  

@override final  int? page;

/// Create a copy of SlidersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchRequestedCopyWith<_FetchRequested> get copyWith => __$FetchRequestedCopyWithImpl<_FetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'SlidersEvent.fetchRequested(page: $page)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $SlidersEventCopyWith<$Res> {
  factory _$FetchRequestedCopyWith(_FetchRequested value, $Res Function(_FetchRequested) _then) = __$FetchRequestedCopyWithImpl;
@override @useResult
$Res call({
 int? page
});




}
/// @nodoc
class __$FetchRequestedCopyWithImpl<$Res>
    implements _$FetchRequestedCopyWith<$Res> {
  __$FetchRequestedCopyWithImpl(this._self, this._then);

  final _FetchRequested _self;
  final $Res Function(_FetchRequested) _then;

/// Create a copy of SlidersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,}) {
  return _then(_FetchRequested(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$SlidersState {

 bool get isLoading; List<SliderItem> get items; Pagination? get pagination; Option<Either<GlobalFailure, Paginated<SliderItem>>> get resultOption;
/// Create a copy of SlidersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlidersStateCopyWith<SlidersState> get copyWith => _$SlidersStateCopyWithImpl<SlidersState>(this as SlidersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlidersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),pagination,resultOption);

@override
String toString() {
  return 'SlidersState(isLoading: $isLoading, items: $items, pagination: $pagination, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $SlidersStateCopyWith<$Res>  {
  factory $SlidersStateCopyWith(SlidersState value, $Res Function(SlidersState) _then) = _$SlidersStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<SliderItem> items, Pagination? pagination, Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption
});




}
/// @nodoc
class _$SlidersStateCopyWithImpl<$Res>
    implements $SlidersStateCopyWith<$Res> {
  _$SlidersStateCopyWithImpl(this._self, this._then);

  final SlidersState _self;
  final $Res Function(SlidersState) _then;

/// Create a copy of SlidersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = null,Object? pagination = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SliderItem>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<SliderItem>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SlidersState].
extension SlidersStatePatterns on SlidersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlidersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlidersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlidersState value)  $default,){
final _that = this;
switch (_that) {
case _SlidersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlidersState value)?  $default,){
final _that = this;
switch (_that) {
case _SlidersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<SliderItem> items,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlidersState() when $default != null:
return $default(_that.isLoading,_that.items,_that.pagination,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<SliderItem> items,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _SlidersState():
return $default(_that.isLoading,_that.items,_that.pagination,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<SliderItem> items,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _SlidersState() when $default != null:
return $default(_that.isLoading,_that.items,_that.pagination,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _SlidersState implements SlidersState {
  const _SlidersState({this.isLoading = false, final  List<SliderItem> items = const <SliderItem>[], this.pagination, required this.resultOption}): _items = items;
  

@override@JsonKey() final  bool isLoading;
 final  List<SliderItem> _items;
@override@JsonKey() List<SliderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Pagination? pagination;
@override final  Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption;

/// Create a copy of SlidersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlidersStateCopyWith<_SlidersState> get copyWith => __$SlidersStateCopyWithImpl<_SlidersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlidersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),pagination,resultOption);

@override
String toString() {
  return 'SlidersState(isLoading: $isLoading, items: $items, pagination: $pagination, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$SlidersStateCopyWith<$Res> implements $SlidersStateCopyWith<$Res> {
  factory _$SlidersStateCopyWith(_SlidersState value, $Res Function(_SlidersState) _then) = __$SlidersStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<SliderItem> items, Pagination? pagination, Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption
});




}
/// @nodoc
class __$SlidersStateCopyWithImpl<$Res>
    implements _$SlidersStateCopyWith<$Res> {
  __$SlidersStateCopyWithImpl(this._self, this._then);

  final _SlidersState _self;
  final $Res Function(_SlidersState) _then;

/// Create a copy of SlidersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = null,Object? pagination = freezed,Object? resultOption = null,}) {
  return _then(_SlidersState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SliderItem>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<SliderItem>>>,
  ));
}


}

// dart format on
