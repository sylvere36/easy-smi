// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizzEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizzEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizzEvent()';
}


}

/// @nodoc
class $QuizzEventCopyWith<$Res>  {
$QuizzEventCopyWith(QuizzEvent _, $Res Function(QuizzEvent) __);
}


/// Adds pattern-matching-related methods to [QuizzEvent].
extension QuizzEventPatterns on QuizzEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _FetchDetailRequested value)?  fetchDetailRequested,TResult Function( _SearchRequested value)?  searchRequested,TResult Function( _SubmitRequested value)?  submitRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that);case _SearchRequested() when searchRequested != null:
return searchRequested(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _FetchDetailRequested value)  fetchDetailRequested,required TResult Function( _SearchRequested value)  searchRequested,required TResult Function( _SubmitRequested value)  submitRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _FetchDetailRequested():
return fetchDetailRequested(_that);case _SearchRequested():
return searchRequested(_that);case _SubmitRequested():
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _FetchDetailRequested value)?  fetchDetailRequested,TResult? Function( _SearchRequested value)?  searchRequested,TResult? Function( _SubmitRequested value)?  submitRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that);case _SearchRequested() when searchRequested != null:
return searchRequested(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? page)?  fetchRequested,TResult Function( int id)?  fetchDetailRequested,TResult Function( String query)?  searchRequested,TResult Function( QuizzSubmissionRequest request)?  submitRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that.id);case _SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? page)  fetchRequested,required TResult Function( int id)  fetchDetailRequested,required TResult Function( String query)  searchRequested,required TResult Function( QuizzSubmissionRequest request)  submitRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.page);case _FetchDetailRequested():
return fetchDetailRequested(_that.id);case _SearchRequested():
return searchRequested(_that.query);case _SubmitRequested():
return submitRequested(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? page)?  fetchRequested,TResult? Function( int id)?  fetchDetailRequested,TResult? Function( String query)?  searchRequested,TResult? Function( QuizzSubmissionRequest request)?  submitRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.page);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that.id);case _SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements QuizzEvent {
  const _FetchRequested({this.page});
  

 final  int? page;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'QuizzEvent.fetchRequested(page: $page)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $QuizzEventCopyWith<$Res> {
  factory _$FetchRequestedCopyWith(_FetchRequested value, $Res Function(_FetchRequested) _then) = __$FetchRequestedCopyWithImpl;
@useResult
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

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = freezed,}) {
  return _then(_FetchRequested(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _FetchDetailRequested implements QuizzEvent {
  const _FetchDetailRequested({required this.id});
  

 final  int id;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchDetailRequestedCopyWith<_FetchDetailRequested> get copyWith => __$FetchDetailRequestedCopyWithImpl<_FetchDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchDetailRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'QuizzEvent.fetchDetailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchDetailRequestedCopyWith<$Res> implements $QuizzEventCopyWith<$Res> {
  factory _$FetchDetailRequestedCopyWith(_FetchDetailRequested value, $Res Function(_FetchDetailRequested) _then) = __$FetchDetailRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchDetailRequestedCopyWithImpl<$Res>
    implements _$FetchDetailRequestedCopyWith<$Res> {
  __$FetchDetailRequestedCopyWithImpl(this._self, this._then);

  final _FetchDetailRequested _self;
  final $Res Function(_FetchDetailRequested) _then;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchDetailRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SearchRequested implements QuizzEvent {
  const _SearchRequested({required this.query});
  

 final  String query;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRequestedCopyWith<_SearchRequested> get copyWith => __$SearchRequestedCopyWithImpl<_SearchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRequested&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'QuizzEvent.searchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchRequestedCopyWith<$Res> implements $QuizzEventCopyWith<$Res> {
  factory _$SearchRequestedCopyWith(_SearchRequested value, $Res Function(_SearchRequested) _then) = __$SearchRequestedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchRequestedCopyWithImpl<$Res>
    implements _$SearchRequestedCopyWith<$Res> {
  __$SearchRequestedCopyWithImpl(this._self, this._then);

  final _SearchRequested _self;
  final $Res Function(_SearchRequested) _then;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchRequested(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitRequested implements QuizzEvent {
  const _SubmitRequested({required this.request});
  

 final  QuizzSubmissionRequest request;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitRequestedCopyWith<_SubmitRequested> get copyWith => __$SubmitRequestedCopyWithImpl<_SubmitRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'QuizzEvent.submitRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class _$SubmitRequestedCopyWith<$Res> implements $QuizzEventCopyWith<$Res> {
  factory _$SubmitRequestedCopyWith(_SubmitRequested value, $Res Function(_SubmitRequested) _then) = __$SubmitRequestedCopyWithImpl;
@useResult
$Res call({
 QuizzSubmissionRequest request
});




}
/// @nodoc
class __$SubmitRequestedCopyWithImpl<$Res>
    implements _$SubmitRequestedCopyWith<$Res> {
  __$SubmitRequestedCopyWithImpl(this._self, this._then);

  final _SubmitRequested _self;
  final $Res Function(_SubmitRequested) _then;

/// Create a copy of QuizzEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_SubmitRequested(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as QuizzSubmissionRequest,
  ));
}


}

/// @nodoc
mixin _$QuizzState {

 bool get isLoading; List<QuizzItem> get items; List<QuizzItem> get initialItems; Pagination? get pagination; Option<Either<GlobalFailure, Paginated<QuizzItem>>> get resultOption; bool get isDetailLoading; QuizzItem? get detail; Option<Either<GlobalFailure, QuizzItem>> get detailResultOption;// Submission state
 bool get isSubmitting; QuizzSubmissionResult? get lastSubmission; Option<Either<GlobalFailure, QuizzSubmissionResult>> get submitResultOption;
/// Create a copy of QuizzState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizzStateCopyWith<QuizzState> get copyWith => _$QuizzStateCopyWithImpl<QuizzState>(this as QuizzState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizzState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.initialItems, initialItems)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.detailResultOption, detailResultOption) || other.detailResultOption == detailResultOption)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.lastSubmission, lastSubmission) || other.lastSubmission == lastSubmission)&&(identical(other.submitResultOption, submitResultOption) || other.submitResultOption == submitResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(initialItems),pagination,resultOption,isDetailLoading,detail,detailResultOption,isSubmitting,lastSubmission,submitResultOption);

@override
String toString() {
  return 'QuizzState(isLoading: $isLoading, items: $items, initialItems: $initialItems, pagination: $pagination, resultOption: $resultOption, isDetailLoading: $isDetailLoading, detail: $detail, detailResultOption: $detailResultOption, isSubmitting: $isSubmitting, lastSubmission: $lastSubmission, submitResultOption: $submitResultOption)';
}


}

/// @nodoc
abstract mixin class $QuizzStateCopyWith<$Res>  {
  factory $QuizzStateCopyWith(QuizzState value, $Res Function(QuizzState) _then) = _$QuizzStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<QuizzItem> items, List<QuizzItem> initialItems, Pagination? pagination, Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption, bool isDetailLoading, QuizzItem? detail, Option<Either<GlobalFailure, QuizzItem>> detailResultOption, bool isSubmitting, QuizzSubmissionResult? lastSubmission, Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption
});




}
/// @nodoc
class _$QuizzStateCopyWithImpl<$Res>
    implements $QuizzStateCopyWith<$Res> {
  _$QuizzStateCopyWithImpl(this._self, this._then);

  final QuizzState _self;
  final $Res Function(QuizzState) _then;

/// Create a copy of QuizzState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = null,Object? initialItems = null,Object? pagination = freezed,Object? resultOption = null,Object? isDetailLoading = null,Object? detail = freezed,Object? detailResultOption = null,Object? isSubmitting = null,Object? lastSubmission = freezed,Object? submitResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QuizzItem>,initialItems: null == initialItems ? _self.initialItems : initialItems // ignore: cast_nullable_to_non_nullable
as List<QuizzItem>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<QuizzItem>>>,isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as QuizzItem?,detailResultOption: null == detailResultOption ? _self.detailResultOption : detailResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, QuizzItem>>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,lastSubmission: freezed == lastSubmission ? _self.lastSubmission : lastSubmission // ignore: cast_nullable_to_non_nullable
as QuizzSubmissionResult?,submitResultOption: null == submitResultOption ? _self.submitResultOption : submitResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, QuizzSubmissionResult>>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizzState].
extension QuizzStatePatterns on QuizzState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizzState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizzState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizzState value)  $default,){
final _that = this;
switch (_that) {
case _QuizzState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizzState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizzState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<QuizzItem> items,  List<QuizzItem> initialItems,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption,  bool isDetailLoading,  QuizzItem? detail,  Option<Either<GlobalFailure, QuizzItem>> detailResultOption,  bool isSubmitting,  QuizzSubmissionResult? lastSubmission,  Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizzState() when $default != null:
return $default(_that.isLoading,_that.items,_that.initialItems,_that.pagination,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isSubmitting,_that.lastSubmission,_that.submitResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<QuizzItem> items,  List<QuizzItem> initialItems,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption,  bool isDetailLoading,  QuizzItem? detail,  Option<Either<GlobalFailure, QuizzItem>> detailResultOption,  bool isSubmitting,  QuizzSubmissionResult? lastSubmission,  Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption)  $default,) {final _that = this;
switch (_that) {
case _QuizzState():
return $default(_that.isLoading,_that.items,_that.initialItems,_that.pagination,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isSubmitting,_that.lastSubmission,_that.submitResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<QuizzItem> items,  List<QuizzItem> initialItems,  Pagination? pagination,  Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption,  bool isDetailLoading,  QuizzItem? detail,  Option<Either<GlobalFailure, QuizzItem>> detailResultOption,  bool isSubmitting,  QuizzSubmissionResult? lastSubmission,  Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption)?  $default,) {final _that = this;
switch (_that) {
case _QuizzState() when $default != null:
return $default(_that.isLoading,_that.items,_that.initialItems,_that.pagination,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isSubmitting,_that.lastSubmission,_that.submitResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _QuizzState implements QuizzState {
  const _QuizzState({this.isLoading = false, final  List<QuizzItem> items = const <QuizzItem>[], final  List<QuizzItem> initialItems = const <QuizzItem>[], this.pagination, required this.resultOption, this.isDetailLoading = false, this.detail, required this.detailResultOption, this.isSubmitting = false, this.lastSubmission, required this.submitResultOption}): _items = items,_initialItems = initialItems;
  

@override@JsonKey() final  bool isLoading;
 final  List<QuizzItem> _items;
@override@JsonKey() List<QuizzItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<QuizzItem> _initialItems;
@override@JsonKey() List<QuizzItem> get initialItems {
  if (_initialItems is EqualUnmodifiableListView) return _initialItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_initialItems);
}

@override final  Pagination? pagination;
@override final  Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption;
@override@JsonKey() final  bool isDetailLoading;
@override final  QuizzItem? detail;
@override final  Option<Either<GlobalFailure, QuizzItem>> detailResultOption;
// Submission state
@override@JsonKey() final  bool isSubmitting;
@override final  QuizzSubmissionResult? lastSubmission;
@override final  Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption;

/// Create a copy of QuizzState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizzStateCopyWith<_QuizzState> get copyWith => __$QuizzStateCopyWithImpl<_QuizzState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizzState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._initialItems, _initialItems)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.detailResultOption, detailResultOption) || other.detailResultOption == detailResultOption)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.lastSubmission, lastSubmission) || other.lastSubmission == lastSubmission)&&(identical(other.submitResultOption, submitResultOption) || other.submitResultOption == submitResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_initialItems),pagination,resultOption,isDetailLoading,detail,detailResultOption,isSubmitting,lastSubmission,submitResultOption);

@override
String toString() {
  return 'QuizzState(isLoading: $isLoading, items: $items, initialItems: $initialItems, pagination: $pagination, resultOption: $resultOption, isDetailLoading: $isDetailLoading, detail: $detail, detailResultOption: $detailResultOption, isSubmitting: $isSubmitting, lastSubmission: $lastSubmission, submitResultOption: $submitResultOption)';
}


}

/// @nodoc
abstract mixin class _$QuizzStateCopyWith<$Res> implements $QuizzStateCopyWith<$Res> {
  factory _$QuizzStateCopyWith(_QuizzState value, $Res Function(_QuizzState) _then) = __$QuizzStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<QuizzItem> items, List<QuizzItem> initialItems, Pagination? pagination, Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption, bool isDetailLoading, QuizzItem? detail, Option<Either<GlobalFailure, QuizzItem>> detailResultOption, bool isSubmitting, QuizzSubmissionResult? lastSubmission, Option<Either<GlobalFailure, QuizzSubmissionResult>> submitResultOption
});




}
/// @nodoc
class __$QuizzStateCopyWithImpl<$Res>
    implements _$QuizzStateCopyWith<$Res> {
  __$QuizzStateCopyWithImpl(this._self, this._then);

  final _QuizzState _self;
  final $Res Function(_QuizzState) _then;

/// Create a copy of QuizzState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = null,Object? initialItems = null,Object? pagination = freezed,Object? resultOption = null,Object? isDetailLoading = null,Object? detail = freezed,Object? detailResultOption = null,Object? isSubmitting = null,Object? lastSubmission = freezed,Object? submitResultOption = null,}) {
  return _then(_QuizzState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QuizzItem>,initialItems: null == initialItems ? _self._initialItems : initialItems // ignore: cast_nullable_to_non_nullable
as List<QuizzItem>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<QuizzItem>>>,isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as QuizzItem?,detailResultOption: null == detailResultOption ? _self.detailResultOption : detailResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, QuizzItem>>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,lastSubmission: freezed == lastSubmission ? _self.lastSubmission : lastSubmission // ignore: cast_nullable_to_non_nullable
as QuizzSubmissionResult?,submitResultOption: null == submitResultOption ? _self.submitResultOption : submitResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, QuizzSubmissionResult>>,
  ));
}


}

// dart format on
