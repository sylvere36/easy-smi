// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationsEvent()';
}


}

/// @nodoc
class $FormationsEventCopyWith<$Res>  {
$FormationsEventCopyWith(FormationsEvent _, $Res Function(FormationsEvent) __);
}


/// Adds pattern-matching-related methods to [FormationsEvent].
extension FormationsEventPatterns on FormationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _FetchNextPage value)?  fetchNextPage,TResult Function( _FetchMyFormationsRequested value)?  fetchMyFormationsRequested,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _FetchMyFormationsRequested() when fetchMyFormationsRequested != null:
return fetchMyFormationsRequested(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _FetchNextPage value)  fetchNextPage,required TResult Function( _FetchMyFormationsRequested value)  fetchMyFormationsRequested,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _FetchNextPage():
return fetchNextPage(_that);case _FetchMyFormationsRequested():
return fetchMyFormationsRequested(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _FetchNextPage value)?  fetchNextPage,TResult? Function( _FetchMyFormationsRequested value)?  fetchMyFormationsRequested,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _FetchMyFormationsRequested() when fetchMyFormationsRequested != null:
return fetchMyFormationsRequested(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,TResult Function()?  fetchNextPage,TResult Function()?  fetchMyFormationsRequested,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _FetchMyFormationsRequested() when fetchMyFormationsRequested != null:
return fetchMyFormationsRequested();case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,required TResult Function()  fetchNextPage,required TResult Function()  fetchMyFormationsRequested,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested();case _FetchNextPage():
return fetchNextPage();case _FetchMyFormationsRequested():
return fetchMyFormationsRequested();case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,TResult? Function()?  fetchNextPage,TResult? Function()?  fetchMyFormationsRequested,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _FetchMyFormationsRequested() when fetchMyFormationsRequested != null:
return fetchMyFormationsRequested();case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements FormationsEvent {
  const _FetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationsEvent.fetchRequested()';
}


}




/// @nodoc


class _FetchNextPage implements FormationsEvent {
  const _FetchNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationsEvent.fetchNextPage()';
}


}




/// @nodoc


class _FetchMyFormationsRequested implements FormationsEvent {
  const _FetchMyFormationsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchMyFormationsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationsEvent.fetchMyFormationsRequested()';
}


}




/// @nodoc


class _Reset implements FormationsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationsEvent.reset()';
}


}




/// @nodoc
mixin _$FormationsState {

 bool get isLoading; bool get isLoadingMyFormations; List<FormationItem> get items; List<MyFormation> get itemsMyFormations; int get currentPage; int get currentPageMyFormations; int get perPage; int get perPageMyFormations; int get total; int get totalMyFormations; bool get canLoadMore; bool get canLoadMoreMyFormations; Option<Either<GlobalFailure, Paginated<FormationItem>>> get resultOption; Option<Either<GlobalFailure, Paginated<FormationItem>>> get resultOptionMyFormations;
/// Create a copy of FormationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormationsStateCopyWith<FormationsState> get copyWith => _$FormationsStateCopyWithImpl<FormationsState>(this as FormationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMyFormations, isLoadingMyFormations) || other.isLoadingMyFormations == isLoadingMyFormations)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.itemsMyFormations, itemsMyFormations)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.currentPageMyFormations, currentPageMyFormations) || other.currentPageMyFormations == currentPageMyFormations)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.perPageMyFormations, perPageMyFormations) || other.perPageMyFormations == perPageMyFormations)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalMyFormations, totalMyFormations) || other.totalMyFormations == totalMyFormations)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.canLoadMoreMyFormations, canLoadMoreMyFormations) || other.canLoadMoreMyFormations == canLoadMoreMyFormations)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.resultOptionMyFormations, resultOptionMyFormations) || other.resultOptionMyFormations == resultOptionMyFormations));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingMyFormations,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(itemsMyFormations),currentPage,currentPageMyFormations,perPage,perPageMyFormations,total,totalMyFormations,canLoadMore,canLoadMoreMyFormations,resultOption,resultOptionMyFormations);

@override
String toString() {
  return 'FormationsState(isLoading: $isLoading, isLoadingMyFormations: $isLoadingMyFormations, items: $items, itemsMyFormations: $itemsMyFormations, currentPage: $currentPage, currentPageMyFormations: $currentPageMyFormations, perPage: $perPage, perPageMyFormations: $perPageMyFormations, total: $total, totalMyFormations: $totalMyFormations, canLoadMore: $canLoadMore, canLoadMoreMyFormations: $canLoadMoreMyFormations, resultOption: $resultOption, resultOptionMyFormations: $resultOptionMyFormations)';
}


}

/// @nodoc
abstract mixin class $FormationsStateCopyWith<$Res>  {
  factory $FormationsStateCopyWith(FormationsState value, $Res Function(FormationsState) _then) = _$FormationsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isLoadingMyFormations, List<FormationItem> items, List<MyFormation> itemsMyFormations, int currentPage, int currentPageMyFormations, int perPage, int perPageMyFormations, int total, int totalMyFormations, bool canLoadMore, bool canLoadMoreMyFormations, Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption, Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations
});




}
/// @nodoc
class _$FormationsStateCopyWithImpl<$Res>
    implements $FormationsStateCopyWith<$Res> {
  _$FormationsStateCopyWithImpl(this._self, this._then);

  final FormationsState _self;
  final $Res Function(FormationsState) _then;

/// Create a copy of FormationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isLoadingMyFormations = null,Object? items = null,Object? itemsMyFormations = null,Object? currentPage = null,Object? currentPageMyFormations = null,Object? perPage = null,Object? perPageMyFormations = null,Object? total = null,Object? totalMyFormations = null,Object? canLoadMore = null,Object? canLoadMoreMyFormations = null,Object? resultOption = null,Object? resultOptionMyFormations = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMyFormations: null == isLoadingMyFormations ? _self.isLoadingMyFormations : isLoadingMyFormations // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FormationItem>,itemsMyFormations: null == itemsMyFormations ? _self.itemsMyFormations : itemsMyFormations // ignore: cast_nullable_to_non_nullable
as List<MyFormation>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,currentPageMyFormations: null == currentPageMyFormations ? _self.currentPageMyFormations : currentPageMyFormations // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,perPageMyFormations: null == perPageMyFormations ? _self.perPageMyFormations : perPageMyFormations // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalMyFormations: null == totalMyFormations ? _self.totalMyFormations : totalMyFormations // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,canLoadMoreMyFormations: null == canLoadMoreMyFormations ? _self.canLoadMoreMyFormations : canLoadMoreMyFormations // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<FormationItem>>>,resultOptionMyFormations: null == resultOptionMyFormations ? _self.resultOptionMyFormations : resultOptionMyFormations // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<FormationItem>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormationsState].
extension FormationsStatePatterns on FormationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormationsState value)  $default,){
final _that = this;
switch (_that) {
case _FormationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormationsState value)?  $default,){
final _that = this;
switch (_that) {
case _FormationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingMyFormations,  List<FormationItem> items,  List<MyFormation> itemsMyFormations,  int currentPage,  int currentPageMyFormations,  int perPage,  int perPageMyFormations,  int total,  int totalMyFormations,  bool canLoadMore,  bool canLoadMoreMyFormations,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormationsState() when $default != null:
return $default(_that.isLoading,_that.isLoadingMyFormations,_that.items,_that.itemsMyFormations,_that.currentPage,_that.currentPageMyFormations,_that.perPage,_that.perPageMyFormations,_that.total,_that.totalMyFormations,_that.canLoadMore,_that.canLoadMoreMyFormations,_that.resultOption,_that.resultOptionMyFormations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingMyFormations,  List<FormationItem> items,  List<MyFormation> itemsMyFormations,  int currentPage,  int currentPageMyFormations,  int perPage,  int perPageMyFormations,  int total,  int totalMyFormations,  bool canLoadMore,  bool canLoadMoreMyFormations,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations)  $default,) {final _that = this;
switch (_that) {
case _FormationsState():
return $default(_that.isLoading,_that.isLoadingMyFormations,_that.items,_that.itemsMyFormations,_that.currentPage,_that.currentPageMyFormations,_that.perPage,_that.perPageMyFormations,_that.total,_that.totalMyFormations,_that.canLoadMore,_that.canLoadMoreMyFormations,_that.resultOption,_that.resultOptionMyFormations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isLoadingMyFormations,  List<FormationItem> items,  List<MyFormation> itemsMyFormations,  int currentPage,  int currentPageMyFormations,  int perPage,  int perPageMyFormations,  int total,  int totalMyFormations,  bool canLoadMore,  bool canLoadMoreMyFormations,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption,  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations)?  $default,) {final _that = this;
switch (_that) {
case _FormationsState() when $default != null:
return $default(_that.isLoading,_that.isLoadingMyFormations,_that.items,_that.itemsMyFormations,_that.currentPage,_that.currentPageMyFormations,_that.perPage,_that.perPageMyFormations,_that.total,_that.totalMyFormations,_that.canLoadMore,_that.canLoadMoreMyFormations,_that.resultOption,_that.resultOptionMyFormations);case _:
  return null;

}
}

}

/// @nodoc


class _FormationsState implements FormationsState {
  const _FormationsState({required this.isLoading, required this.isLoadingMyFormations, required final  List<FormationItem> items, required final  List<MyFormation> itemsMyFormations, required this.currentPage, required this.currentPageMyFormations, required this.perPage, required this.perPageMyFormations, required this.total, required this.totalMyFormations, required this.canLoadMore, required this.canLoadMoreMyFormations, required this.resultOption, required this.resultOptionMyFormations}): _items = items,_itemsMyFormations = itemsMyFormations;
  

@override final  bool isLoading;
@override final  bool isLoadingMyFormations;
 final  List<FormationItem> _items;
@override List<FormationItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<MyFormation> _itemsMyFormations;
@override List<MyFormation> get itemsMyFormations {
  if (_itemsMyFormations is EqualUnmodifiableListView) return _itemsMyFormations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemsMyFormations);
}

@override final  int currentPage;
@override final  int currentPageMyFormations;
@override final  int perPage;
@override final  int perPageMyFormations;
@override final  int total;
@override final  int totalMyFormations;
@override final  bool canLoadMore;
@override final  bool canLoadMoreMyFormations;
@override final  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption;
@override final  Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations;

/// Create a copy of FormationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormationsStateCopyWith<_FormationsState> get copyWith => __$FormationsStateCopyWithImpl<_FormationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMyFormations, isLoadingMyFormations) || other.isLoadingMyFormations == isLoadingMyFormations)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._itemsMyFormations, _itemsMyFormations)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.currentPageMyFormations, currentPageMyFormations) || other.currentPageMyFormations == currentPageMyFormations)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.perPageMyFormations, perPageMyFormations) || other.perPageMyFormations == perPageMyFormations)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalMyFormations, totalMyFormations) || other.totalMyFormations == totalMyFormations)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.canLoadMoreMyFormations, canLoadMoreMyFormations) || other.canLoadMoreMyFormations == canLoadMoreMyFormations)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.resultOptionMyFormations, resultOptionMyFormations) || other.resultOptionMyFormations == resultOptionMyFormations));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingMyFormations,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_itemsMyFormations),currentPage,currentPageMyFormations,perPage,perPageMyFormations,total,totalMyFormations,canLoadMore,canLoadMoreMyFormations,resultOption,resultOptionMyFormations);

@override
String toString() {
  return 'FormationsState(isLoading: $isLoading, isLoadingMyFormations: $isLoadingMyFormations, items: $items, itemsMyFormations: $itemsMyFormations, currentPage: $currentPage, currentPageMyFormations: $currentPageMyFormations, perPage: $perPage, perPageMyFormations: $perPageMyFormations, total: $total, totalMyFormations: $totalMyFormations, canLoadMore: $canLoadMore, canLoadMoreMyFormations: $canLoadMoreMyFormations, resultOption: $resultOption, resultOptionMyFormations: $resultOptionMyFormations)';
}


}

/// @nodoc
abstract mixin class _$FormationsStateCopyWith<$Res> implements $FormationsStateCopyWith<$Res> {
  factory _$FormationsStateCopyWith(_FormationsState value, $Res Function(_FormationsState) _then) = __$FormationsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isLoadingMyFormations, List<FormationItem> items, List<MyFormation> itemsMyFormations, int currentPage, int currentPageMyFormations, int perPage, int perPageMyFormations, int total, int totalMyFormations, bool canLoadMore, bool canLoadMoreMyFormations, Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOption, Option<Either<GlobalFailure, Paginated<FormationItem>>> resultOptionMyFormations
});




}
/// @nodoc
class __$FormationsStateCopyWithImpl<$Res>
    implements _$FormationsStateCopyWith<$Res> {
  __$FormationsStateCopyWithImpl(this._self, this._then);

  final _FormationsState _self;
  final $Res Function(_FormationsState) _then;

/// Create a copy of FormationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isLoadingMyFormations = null,Object? items = null,Object? itemsMyFormations = null,Object? currentPage = null,Object? currentPageMyFormations = null,Object? perPage = null,Object? perPageMyFormations = null,Object? total = null,Object? totalMyFormations = null,Object? canLoadMore = null,Object? canLoadMoreMyFormations = null,Object? resultOption = null,Object? resultOptionMyFormations = null,}) {
  return _then(_FormationsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMyFormations: null == isLoadingMyFormations ? _self.isLoadingMyFormations : isLoadingMyFormations // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FormationItem>,itemsMyFormations: null == itemsMyFormations ? _self._itemsMyFormations : itemsMyFormations // ignore: cast_nullable_to_non_nullable
as List<MyFormation>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,currentPageMyFormations: null == currentPageMyFormations ? _self.currentPageMyFormations : currentPageMyFormations // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,perPageMyFormations: null == perPageMyFormations ? _self.perPageMyFormations : perPageMyFormations // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalMyFormations: null == totalMyFormations ? _self.totalMyFormations : totalMyFormations // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,canLoadMoreMyFormations: null == canLoadMoreMyFormations ? _self.canLoadMoreMyFormations : canLoadMoreMyFormations // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<FormationItem>>>,resultOptionMyFormations: null == resultOptionMyFormations ? _self.resultOptionMyFormations : resultOptionMyFormations // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<FormationItem>>>,
  ));
}


}

// dart format on
