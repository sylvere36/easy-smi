// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuditsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent()';
}


}

/// @nodoc
class $AuditsEventCopyWith<$Res>  {
$AuditsEventCopyWith(AuditsEvent _, $Res Function(AuditsEvent) __);
}


/// Adds pattern-matching-related methods to [AuditsEvent].
extension AuditsEventPatterns on AuditsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _FetchNextPage value)?  fetchNextPage,TResult Function( _Reset value)?  reset,TResult Function( _FetchOngoing value)?  fetchOngoing,TResult Function( _FetchUpcoming value)?  fetchUpcoming,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
return reset(_that);case _FetchOngoing() when fetchOngoing != null:
return fetchOngoing(_that);case _FetchUpcoming() when fetchUpcoming != null:
return fetchUpcoming(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _FetchNextPage value)  fetchNextPage,required TResult Function( _Reset value)  reset,required TResult Function( _FetchOngoing value)  fetchOngoing,required TResult Function( _FetchUpcoming value)  fetchUpcoming,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _FetchNextPage():
return fetchNextPage(_that);case _Reset():
return reset(_that);case _FetchOngoing():
return fetchOngoing(_that);case _FetchUpcoming():
return fetchUpcoming(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _FetchNextPage value)?  fetchNextPage,TResult? Function( _Reset value)?  reset,TResult? Function( _FetchOngoing value)?  fetchOngoing,TResult? Function( _FetchUpcoming value)?  fetchUpcoming,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
return reset(_that);case _FetchOngoing() when fetchOngoing != null:
return fetchOngoing(_that);case _FetchUpcoming() when fetchUpcoming != null:
return fetchUpcoming(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function()?  fetchNextPage,TResult Function()?  reset,TResult Function()?  fetchOngoing,TResult Function()?  fetchUpcoming,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
return reset();case _FetchOngoing() when fetchOngoing != null:
return fetchOngoing();case _FetchUpcoming() when fetchUpcoming != null:
return fetchUpcoming();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function()  fetchNextPage,required TResult Function()  reset,required TResult Function()  fetchOngoing,required TResult Function()  fetchUpcoming,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch();case _FetchNextPage():
return fetchNextPage();case _Reset():
return reset();case _FetchOngoing():
return fetchOngoing();case _FetchUpcoming():
return fetchUpcoming();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function()?  fetchNextPage,TResult? Function()?  reset,TResult? Function()?  fetchOngoing,TResult? Function()?  fetchUpcoming,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
return reset();case _FetchOngoing() when fetchOngoing != null:
return fetchOngoing();case _FetchUpcoming() when fetchUpcoming != null:
return fetchUpcoming();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements AuditsEvent {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent.fetch()';
}


}




/// @nodoc


class _FetchNextPage implements AuditsEvent {
  const _FetchNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent.fetchNextPage()';
}


}




/// @nodoc


class _Reset implements AuditsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent.reset()';
}


}




/// @nodoc


class _FetchOngoing implements AuditsEvent {
  const _FetchOngoing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOngoing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent.fetchOngoing()';
}


}




/// @nodoc


class _FetchUpcoming implements AuditsEvent {
  const _FetchUpcoming();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUpcoming);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditsEvent.fetchUpcoming()';
}


}




/// @nodoc
mixin _$AuditsState {

 bool get isLoading; List<AuditItem>? get items; int get currentPage; int get perPage; int get total; bool get canLoadMore; Option<Either<GlobalFailure, Paginated<AuditItem>>> get resultOption; AuditListMode get mode;
/// Create a copy of AuditsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditsStateCopyWith<AuditsState> get copyWith => _$AuditsStateCopyWithImpl<AuditsState>(this as AuditsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),currentPage,perPage,total,canLoadMore,resultOption,mode);

@override
String toString() {
  return 'AuditsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $AuditsStateCopyWith<$Res>  {
  factory $AuditsStateCopyWith(AuditsState value, $Res Function(AuditsState) _then) = _$AuditsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<AuditItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption, AuditListMode mode
});




}
/// @nodoc
class _$AuditsStateCopyWithImpl<$Res>
    implements $AuditsStateCopyWith<$Res> {
  _$AuditsStateCopyWithImpl(this._self, this._then);

  final AuditsState _self;
  final $Res Function(AuditsState) _then;

/// Create a copy of AuditsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,Object? mode = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AuditItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<AuditItem>>>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuditListMode,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditsState].
extension AuditsStatePatterns on AuditsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditsState value)  $default,){
final _that = this;
switch (_that) {
case _AuditsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditsState value)?  $default,){
final _that = this;
switch (_that) {
case _AuditsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<AuditItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption,  AuditListMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<AuditItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption,  AuditListMode mode)  $default,) {final _that = this;
switch (_that) {
case _AuditsState():
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<AuditItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption,  AuditListMode mode)?  $default,) {final _that = this;
switch (_that) {
case _AuditsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.mode);case _:
  return null;

}
}

}

/// @nodoc


class _AuditsState implements AuditsState {
  const _AuditsState({required this.isLoading, required final  List<AuditItem>? items, required this.currentPage, required this.perPage, required this.total, required this.canLoadMore, required this.resultOption, required this.mode}): _items = items;
  

@override final  bool isLoading;
 final  List<AuditItem>? _items;
@override List<AuditItem>? get items {
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
@override final  Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption;
@override final  AuditListMode mode;

/// Create a copy of AuditsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditsStateCopyWith<_AuditsState> get copyWith => __$AuditsStateCopyWithImpl<_AuditsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),currentPage,perPage,total,canLoadMore,resultOption,mode);

@override
String toString() {
  return 'AuditsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$AuditsStateCopyWith<$Res> implements $AuditsStateCopyWith<$Res> {
  factory _$AuditsStateCopyWith(_AuditsState value, $Res Function(_AuditsState) _then) = __$AuditsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<AuditItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption, AuditListMode mode
});




}
/// @nodoc
class __$AuditsStateCopyWithImpl<$Res>
    implements _$AuditsStateCopyWith<$Res> {
  __$AuditsStateCopyWithImpl(this._self, this._then);

  final _AuditsState _self;
  final $Res Function(_AuditsState) _then;

/// Create a copy of AuditsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,Object? mode = null,}) {
  return _then(_AuditsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AuditItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<AuditItem>>>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuditListMode,
  ));
}


}

// dart format on
