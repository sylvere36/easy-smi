// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermitsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermitsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermitsEvent()';
}


}

/// @nodoc
class $PermitsEventCopyWith<$Res>  {
$PermitsEventCopyWith(PermitsEvent _, $Res Function(PermitsEvent) __);
}


/// Adds pattern-matching-related methods to [PermitsEvent].
extension PermitsEventPatterns on PermitsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _FetchNextPage value)?  fetchNextPage,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _FetchNextPage value)  fetchNextPage,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _FetchNextPage():
return fetchNextPage(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _FetchNextPage value)?  fetchNextPage,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,TResult Function()?  fetchNextPage,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,required TResult Function()  fetchNextPage,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested();case _FetchNextPage():
return fetchNextPage();case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,TResult? Function()?  fetchNextPage,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements PermitsEvent {
  const _FetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermitsEvent.fetchRequested()';
}


}




/// @nodoc


class _FetchNextPage implements PermitsEvent {
  const _FetchNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermitsEvent.fetchNextPage()';
}


}




/// @nodoc


class _Reset implements PermitsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermitsEvent.reset()';
}


}




/// @nodoc
mixin _$PermitsState {

 bool get isLoading; List<PermitItem>? get items; int get currentPage; int get perPage; int get total; bool get canLoadMore; Option<Either<GlobalFailure, Paginated<PermitItem>>> get resultOption;
/// Create a copy of PermitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermitsStateCopyWith<PermitsState> get copyWith => _$PermitsStateCopyWithImpl<PermitsState>(this as PermitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermitsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),currentPage,perPage,total,canLoadMore,resultOption);

@override
String toString() {
  return 'PermitsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $PermitsStateCopyWith<$Res>  {
  factory $PermitsStateCopyWith(PermitsState value, $Res Function(PermitsState) _then) = _$PermitsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<PermitItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption
});




}
/// @nodoc
class _$PermitsStateCopyWithImpl<$Res>
    implements $PermitsStateCopyWith<$Res> {
  _$PermitsStateCopyWithImpl(this._self, this._then);

  final PermitsState _self;
  final $Res Function(PermitsState) _then;

/// Create a copy of PermitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PermitItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<PermitItem>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [PermitsState].
extension PermitsStatePatterns on PermitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermitsState value)  $default,){
final _that = this;
switch (_that) {
case _PermitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermitsState value)?  $default,){
final _that = this;
switch (_that) {
case _PermitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<PermitItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermitsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<PermitItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _PermitsState():
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<PermitItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _PermitsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _PermitsState implements PermitsState {
  const _PermitsState({required this.isLoading, required final  List<PermitItem>? items, required this.currentPage, required this.perPage, required this.total, required this.canLoadMore, required this.resultOption}): _items = items;
  

@override final  bool isLoading;
 final  List<PermitItem>? _items;
@override List<PermitItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int currentPage;
@override final  int perPage;
@override final  int total;
@override final  bool canLoadMore;
@override final  Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption;

/// Create a copy of PermitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermitsStateCopyWith<_PermitsState> get copyWith => __$PermitsStateCopyWithImpl<_PermitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermitsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),currentPage,perPage,total,canLoadMore,resultOption);

@override
String toString() {
  return 'PermitsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$PermitsStateCopyWith<$Res> implements $PermitsStateCopyWith<$Res> {
  factory _$PermitsStateCopyWith(_PermitsState value, $Res Function(_PermitsState) _then) = __$PermitsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<PermitItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption
});




}
/// @nodoc
class __$PermitsStateCopyWithImpl<$Res>
    implements _$PermitsStateCopyWith<$Res> {
  __$PermitsStateCopyWithImpl(this._self, this._then);

  final _PermitsState _self;
  final $Res Function(_PermitsState) _then;

/// Create a copy of PermitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,}) {
  return _then(_PermitsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PermitItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<PermitItem>>>,
  ));
}


}

// dart format on
