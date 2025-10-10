// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent()';
}


}

/// @nodoc
class $NotificationsEventCopyWith<$Res>  {
$NotificationsEventCopyWith(NotificationsEvent _, $Res Function(NotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _MarkAsReadRequested value)?  markAsReadRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _MarkAsReadRequested() when markAsReadRequested != null:
return markAsReadRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _MarkAsReadRequested value)  markAsReadRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _RefreshRequested():
return refreshRequested(_that);case _MarkAsReadRequested():
return markAsReadRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _MarkAsReadRequested value)?  markAsReadRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _MarkAsReadRequested() when markAsReadRequested != null:
return markAsReadRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page,  int perPage)?  fetchRequested,TResult Function()?  refreshRequested,TResult Function( int id)?  markAsReadRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page,_that.perPage);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _MarkAsReadRequested() when markAsReadRequested != null:
return markAsReadRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page,  int perPage)  fetchRequested,required TResult Function()  refreshRequested,required TResult Function( int id)  markAsReadRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.page,_that.perPage);case _RefreshRequested():
return refreshRequested();case _MarkAsReadRequested():
return markAsReadRequested(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page,  int perPage)?  fetchRequested,TResult? Function()?  refreshRequested,TResult? Function( int id)?  markAsReadRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page,_that.perPage);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _MarkAsReadRequested() when markAsReadRequested != null:
return markAsReadRequested(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements NotificationsEvent {
  const _FetchRequested({this.page = 1, this.perPage = 10});
  

@JsonKey() final  int page;
@JsonKey() final  int perPage;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchRequestedCopyWith<_FetchRequested> get copyWith => __$FetchRequestedCopyWithImpl<_FetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,page,perPage);

@override
String toString() {
  return 'NotificationsEvent.fetchRequested(page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$FetchRequestedCopyWith(_FetchRequested value, $Res Function(_FetchRequested) _then) = __$FetchRequestedCopyWithImpl;
@useResult
$Res call({
 int page, int perPage
});




}
/// @nodoc
class __$FetchRequestedCopyWithImpl<$Res>
    implements _$FetchRequestedCopyWith<$Res> {
  __$FetchRequestedCopyWithImpl(this._self, this._then);

  final _FetchRequested _self;
  final $Res Function(_FetchRequested) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? perPage = null,}) {
  return _then(_FetchRequested(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RefreshRequested implements NotificationsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.refreshRequested()';
}


}




/// @nodoc


class _MarkAsReadRequested implements NotificationsEvent {
  const _MarkAsReadRequested({required this.id});
  

 final  int id;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsReadRequestedCopyWith<_MarkAsReadRequested> get copyWith => __$MarkAsReadRequestedCopyWithImpl<_MarkAsReadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsReadRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NotificationsEvent.markAsReadRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadRequestedCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$MarkAsReadRequestedCopyWith(_MarkAsReadRequested value, $Res Function(_MarkAsReadRequested) _then) = __$MarkAsReadRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$MarkAsReadRequestedCopyWithImpl<$Res>
    implements _$MarkAsReadRequestedCopyWith<$Res> {
  __$MarkAsReadRequestedCopyWithImpl(this._self, this._then);

  final _MarkAsReadRequested _self;
  final $Res Function(_MarkAsReadRequested) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MarkAsReadRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NotificationsState {

 List<NotificationItem> get items; int get total; int get perPage; int get currentPage; int get lastPage; int get unreadCount; bool get isLoading; bool get isMarking; Option<Either<GlobalFailure, NotificationPageResult>> get resultOption; Option<Either<GlobalFailure, Unit>> get markResultOption;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isMarking, isMarking) || other.isMarking == isMarking)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.markResultOption, markResultOption) || other.markResultOption == markResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,perPage,currentPage,lastPage,unreadCount,isLoading,isMarking,resultOption,markResultOption);

@override
String toString() {
  return 'NotificationsState(items: $items, total: $total, perPage: $perPage, currentPage: $currentPage, lastPage: $lastPage, unreadCount: $unreadCount, isLoading: $isLoading, isMarking: $isMarking, resultOption: $resultOption, markResultOption: $markResultOption)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 List<NotificationItem> items, int total, int perPage, int currentPage, int lastPage, int unreadCount, bool isLoading, bool isMarking, Option<Either<GlobalFailure, NotificationPageResult>> resultOption, Option<Either<GlobalFailure, Unit>> markResultOption
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? perPage = null,Object? currentPage = null,Object? lastPage = null,Object? unreadCount = null,Object? isLoading = null,Object? isMarking = null,Object? resultOption = null,Object? markResultOption = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isMarking: null == isMarking ? _self.isMarking : isMarking // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, NotificationPageResult>>,markResultOption: null == markResultOption ? _self.markResultOption : markResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationItem> items,  int total,  int perPage,  int currentPage,  int lastPage,  int unreadCount,  bool isLoading,  bool isMarking,  Option<Either<GlobalFailure, NotificationPageResult>> resultOption,  Option<Either<GlobalFailure, Unit>> markResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.items,_that.total,_that.perPage,_that.currentPage,_that.lastPage,_that.unreadCount,_that.isLoading,_that.isMarking,_that.resultOption,_that.markResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationItem> items,  int total,  int perPage,  int currentPage,  int lastPage,  int unreadCount,  bool isLoading,  bool isMarking,  Option<Either<GlobalFailure, NotificationPageResult>> resultOption,  Option<Either<GlobalFailure, Unit>> markResultOption)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.items,_that.total,_that.perPage,_that.currentPage,_that.lastPage,_that.unreadCount,_that.isLoading,_that.isMarking,_that.resultOption,_that.markResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationItem> items,  int total,  int perPage,  int currentPage,  int lastPage,  int unreadCount,  bool isLoading,  bool isMarking,  Option<Either<GlobalFailure, NotificationPageResult>> resultOption,  Option<Either<GlobalFailure, Unit>> markResultOption)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.items,_that.total,_that.perPage,_that.currentPage,_that.lastPage,_that.unreadCount,_that.isLoading,_that.isMarking,_that.resultOption,_that.markResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState implements NotificationsState {
  const _NotificationsState({final  List<NotificationItem> items = const [], this.total = 0, this.perPage = 10, this.currentPage = 1, this.lastPage = 1, this.unreadCount = 0, this.isLoading = false, this.isMarking = false, required this.resultOption, required this.markResultOption}): _items = items;
  

 final  List<NotificationItem> _items;
@override@JsonKey() List<NotificationItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int perPage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isMarking;
@override final  Option<Either<GlobalFailure, NotificationPageResult>> resultOption;
@override final  Option<Either<GlobalFailure, Unit>> markResultOption;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isMarking, isMarking) || other.isMarking == isMarking)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.markResultOption, markResultOption) || other.markResultOption == markResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,perPage,currentPage,lastPage,unreadCount,isLoading,isMarking,resultOption,markResultOption);

@override
String toString() {
  return 'NotificationsState(items: $items, total: $total, perPage: $perPage, currentPage: $currentPage, lastPage: $lastPage, unreadCount: $unreadCount, isLoading: $isLoading, isMarking: $isMarking, resultOption: $resultOption, markResultOption: $markResultOption)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationItem> items, int total, int perPage, int currentPage, int lastPage, int unreadCount, bool isLoading, bool isMarking, Option<Either<GlobalFailure, NotificationPageResult>> resultOption, Option<Either<GlobalFailure, Unit>> markResultOption
});




}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? perPage = null,Object? currentPage = null,Object? lastPage = null,Object? unreadCount = null,Object? isLoading = null,Object? isMarking = null,Object? resultOption = null,Object? markResultOption = null,}) {
  return _then(_NotificationsState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isMarking: null == isMarking ? _self.isMarking : isMarking // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, NotificationPageResult>>,markResultOption: null == markResultOption ? _self.markResultOption : markResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}


}

// dart format on
