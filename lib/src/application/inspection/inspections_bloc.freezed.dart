// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspections_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InspectionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent()';
}


}

/// @nodoc
class $InspectionsEventCopyWith<$Res>  {
$InspectionsEventCopyWith(InspectionsEvent _, $Res Function(InspectionsEvent) __);
}


/// Adds pattern-matching-related methods to [InspectionsEvent].
extension InspectionsEventPatterns on InspectionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _FetchNext value)?  fetchNextPage,TResult Function( _Reset value)?  reset,TResult Function( _FetchForms value)?  fetchInspectionForms,TResult Function( _FetchFormsAvailable value)?  fetchInspectionFormsAvailable,TResult Function( _CreateRequested value)?  createRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FetchNext() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
return reset(_that);case _FetchForms() when fetchInspectionForms != null:
return fetchInspectionForms(_that);case _FetchFormsAvailable() when fetchInspectionFormsAvailable != null:
return fetchInspectionFormsAvailable(_that);case _CreateRequested() when createRequested != null:
return createRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _FetchNext value)  fetchNextPage,required TResult Function( _Reset value)  reset,required TResult Function( _FetchForms value)  fetchInspectionForms,required TResult Function( _FetchFormsAvailable value)  fetchInspectionFormsAvailable,required TResult Function( _CreateRequested value)  createRequested,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _FetchNext():
return fetchNextPage(_that);case _Reset():
return reset(_that);case _FetchForms():
return fetchInspectionForms(_that);case _FetchFormsAvailable():
return fetchInspectionFormsAvailable(_that);case _CreateRequested():
return createRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _FetchNext value)?  fetchNextPage,TResult? Function( _Reset value)?  reset,TResult? Function( _FetchForms value)?  fetchInspectionForms,TResult? Function( _FetchFormsAvailable value)?  fetchInspectionFormsAvailable,TResult? Function( _CreateRequested value)?  createRequested,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FetchNext() when fetchNextPage != null:
return fetchNextPage(_that);case _Reset() when reset != null:
return reset(_that);case _FetchForms() when fetchInspectionForms != null:
return fetchInspectionForms(_that);case _FetchFormsAvailable() when fetchInspectionFormsAvailable != null:
return fetchInspectionFormsAvailable(_that);case _CreateRequested() when createRequested != null:
return createRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function()?  fetchNextPage,TResult Function()?  reset,TResult Function()?  fetchInspectionForms,TResult Function()?  fetchInspectionFormsAvailable,TResult Function( int inspectionFormId,  List<int> siteIds,  String mission,  List<int> inspectorIds,  String? description)?  createRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _FetchNext() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
return reset();case _FetchForms() when fetchInspectionForms != null:
return fetchInspectionForms();case _FetchFormsAvailable() when fetchInspectionFormsAvailable != null:
return fetchInspectionFormsAvailable();case _CreateRequested() when createRequested != null:
return createRequested(_that.inspectionFormId,_that.siteIds,_that.mission,_that.inspectorIds,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function()  fetchNextPage,required TResult Function()  reset,required TResult Function()  fetchInspectionForms,required TResult Function()  fetchInspectionFormsAvailable,required TResult Function( int inspectionFormId,  List<int> siteIds,  String mission,  List<int> inspectorIds,  String? description)  createRequested,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch();case _FetchNext():
return fetchNextPage();case _Reset():
return reset();case _FetchForms():
return fetchInspectionForms();case _FetchFormsAvailable():
return fetchInspectionFormsAvailable();case _CreateRequested():
return createRequested(_that.inspectionFormId,_that.siteIds,_that.mission,_that.inspectorIds,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function()?  fetchNextPage,TResult? Function()?  reset,TResult? Function()?  fetchInspectionForms,TResult? Function()?  fetchInspectionFormsAvailable,TResult? Function( int inspectionFormId,  List<int> siteIds,  String mission,  List<int> inspectorIds,  String? description)?  createRequested,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch();case _FetchNext() when fetchNextPage != null:
return fetchNextPage();case _Reset() when reset != null:
return reset();case _FetchForms() when fetchInspectionForms != null:
return fetchInspectionForms();case _FetchFormsAvailable() when fetchInspectionFormsAvailable != null:
return fetchInspectionFormsAvailable();case _CreateRequested() when createRequested != null:
return createRequested(_that.inspectionFormId,_that.siteIds,_that.mission,_that.inspectorIds,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements InspectionsEvent {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent.fetch()';
}


}




/// @nodoc


class _FetchNext implements InspectionsEvent {
  const _FetchNext();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNext);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent.fetchNextPage()';
}


}




/// @nodoc


class _Reset implements InspectionsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent.reset()';
}


}




/// @nodoc


class _FetchForms implements InspectionsEvent {
  const _FetchForms();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchForms);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent.fetchInspectionForms()';
}


}




/// @nodoc


class _FetchFormsAvailable implements InspectionsEvent {
  const _FetchFormsAvailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchFormsAvailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionsEvent.fetchInspectionFormsAvailable()';
}


}




/// @nodoc


class _CreateRequested implements InspectionsEvent {
  const _CreateRequested({required this.inspectionFormId, required final  List<int> siteIds, required this.mission, required final  List<int> inspectorIds, this.description}): _siteIds = siteIds,_inspectorIds = inspectorIds;
  

 final  int inspectionFormId;
 final  List<int> _siteIds;
 List<int> get siteIds {
  if (_siteIds is EqualUnmodifiableListView) return _siteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_siteIds);
}

 final  String mission;
 final  List<int> _inspectorIds;
 List<int> get inspectorIds {
  if (_inspectorIds is EqualUnmodifiableListView) return _inspectorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inspectorIds);
}

 final  String? description;

/// Create a copy of InspectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRequestedCopyWith<_CreateRequested> get copyWith => __$CreateRequestedCopyWithImpl<_CreateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRequested&&(identical(other.inspectionFormId, inspectionFormId) || other.inspectionFormId == inspectionFormId)&&const DeepCollectionEquality().equals(other._siteIds, _siteIds)&&(identical(other.mission, mission) || other.mission == mission)&&const DeepCollectionEquality().equals(other._inspectorIds, _inspectorIds)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,inspectionFormId,const DeepCollectionEquality().hash(_siteIds),mission,const DeepCollectionEquality().hash(_inspectorIds),description);

@override
String toString() {
  return 'InspectionsEvent.createRequested(inspectionFormId: $inspectionFormId, siteIds: $siteIds, mission: $mission, inspectorIds: $inspectorIds, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateRequestedCopyWith<$Res> implements $InspectionsEventCopyWith<$Res> {
  factory _$CreateRequestedCopyWith(_CreateRequested value, $Res Function(_CreateRequested) _then) = __$CreateRequestedCopyWithImpl;
@useResult
$Res call({
 int inspectionFormId, List<int> siteIds, String mission, List<int> inspectorIds, String? description
});




}
/// @nodoc
class __$CreateRequestedCopyWithImpl<$Res>
    implements _$CreateRequestedCopyWith<$Res> {
  __$CreateRequestedCopyWithImpl(this._self, this._then);

  final _CreateRequested _self;
  final $Res Function(_CreateRequested) _then;

/// Create a copy of InspectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inspectionFormId = null,Object? siteIds = null,Object? mission = null,Object? inspectorIds = null,Object? description = freezed,}) {
  return _then(_CreateRequested(
inspectionFormId: null == inspectionFormId ? _self.inspectionFormId : inspectionFormId // ignore: cast_nullable_to_non_nullable
as int,siteIds: null == siteIds ? _self._siteIds : siteIds // ignore: cast_nullable_to_non_nullable
as List<int>,mission: null == mission ? _self.mission : mission // ignore: cast_nullable_to_non_nullable
as String,inspectorIds: null == inspectorIds ? _self._inspectorIds : inspectorIds // ignore: cast_nullable_to_non_nullable
as List<int>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$InspectionsState {

 bool get isLoading; List<InspectionItem>? get items; int get currentPage; int get perPage; int get total; bool get canLoadMore; Option<Either<GlobalFailure, Paginated<InspectionItem>>> get resultOption;// Inspection forms list (non-paginated)
 bool get isLoadingForms; List<InspectionFormItem> get forms; Option<Either<GlobalFailure, List<InspectionFormItem>>> get formsResultOption;// Available forms (with possible ongoing inspection id)
 bool get isLoadingFormsAvailable; List<InspectionFormAvailableItem> get formsAvailable; Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> get formsAvailableResultOption;// Create inspection
 bool get isCreating; Option<Either<GlobalFailure, InspectionDetail>> get createResultOption;
/// Create a copy of InspectionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionsStateCopyWith<InspectionsState> get copyWith => _$InspectionsStateCopyWithImpl<InspectionsState>(this as InspectionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingForms, isLoadingForms) || other.isLoadingForms == isLoadingForms)&&const DeepCollectionEquality().equals(other.forms, forms)&&(identical(other.formsResultOption, formsResultOption) || other.formsResultOption == formsResultOption)&&(identical(other.isLoadingFormsAvailable, isLoadingFormsAvailable) || other.isLoadingFormsAvailable == isLoadingFormsAvailable)&&const DeepCollectionEquality().equals(other.formsAvailable, formsAvailable)&&(identical(other.formsAvailableResultOption, formsAvailableResultOption) || other.formsAvailableResultOption == formsAvailableResultOption)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.createResultOption, createResultOption) || other.createResultOption == createResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),currentPage,perPage,total,canLoadMore,resultOption,isLoadingForms,const DeepCollectionEquality().hash(forms),formsResultOption,isLoadingFormsAvailable,const DeepCollectionEquality().hash(formsAvailable),formsAvailableResultOption,isCreating,createResultOption);

@override
String toString() {
  return 'InspectionsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption, isLoadingForms: $isLoadingForms, forms: $forms, formsResultOption: $formsResultOption, isLoadingFormsAvailable: $isLoadingFormsAvailable, formsAvailable: $formsAvailable, formsAvailableResultOption: $formsAvailableResultOption, isCreating: $isCreating, createResultOption: $createResultOption)';
}


}

/// @nodoc
abstract mixin class $InspectionsStateCopyWith<$Res>  {
  factory $InspectionsStateCopyWith(InspectionsState value, $Res Function(InspectionsState) _then) = _$InspectionsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<InspectionItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption, bool isLoadingForms, List<InspectionFormItem> forms, Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption, bool isLoadingFormsAvailable, List<InspectionFormAvailableItem> formsAvailable, Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption, bool isCreating, Option<Either<GlobalFailure, InspectionDetail>> createResultOption
});




}
/// @nodoc
class _$InspectionsStateCopyWithImpl<$Res>
    implements $InspectionsStateCopyWith<$Res> {
  _$InspectionsStateCopyWithImpl(this._self, this._then);

  final InspectionsState _self;
  final $Res Function(InspectionsState) _then;

/// Create a copy of InspectionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,Object? isLoadingForms = null,Object? forms = null,Object? formsResultOption = null,Object? isLoadingFormsAvailable = null,Object? formsAvailable = null,Object? formsAvailableResultOption = null,Object? isCreating = null,Object? createResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InspectionItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<InspectionItem>>>,isLoadingForms: null == isLoadingForms ? _self.isLoadingForms : isLoadingForms // ignore: cast_nullable_to_non_nullable
as bool,forms: null == forms ? _self.forms : forms // ignore: cast_nullable_to_non_nullable
as List<InspectionFormItem>,formsResultOption: null == formsResultOption ? _self.formsResultOption : formsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionFormItem>>>,isLoadingFormsAvailable: null == isLoadingFormsAvailable ? _self.isLoadingFormsAvailable : isLoadingFormsAvailable // ignore: cast_nullable_to_non_nullable
as bool,formsAvailable: null == formsAvailable ? _self.formsAvailable : formsAvailable // ignore: cast_nullable_to_non_nullable
as List<InspectionFormAvailableItem>,formsAvailableResultOption: null == formsAvailableResultOption ? _self.formsAvailableResultOption : formsAvailableResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,createResultOption: null == createResultOption ? _self.createResultOption : createResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, InspectionDetail>>,
  ));
}

}


/// Adds pattern-matching-related methods to [InspectionsState].
extension InspectionsStatePatterns on InspectionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectionsState value)  $default,){
final _that = this;
switch (_that) {
case _InspectionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectionsState value)?  $default,){
final _that = this;
switch (_that) {
case _InspectionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<InspectionItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption,  bool isLoadingForms,  List<InspectionFormItem> forms,  Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption,  bool isLoadingFormsAvailable,  List<InspectionFormAvailableItem> formsAvailable,  Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption,  bool isCreating,  Option<Either<GlobalFailure, InspectionDetail>> createResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectionsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.isLoadingForms,_that.forms,_that.formsResultOption,_that.isLoadingFormsAvailable,_that.formsAvailable,_that.formsAvailableResultOption,_that.isCreating,_that.createResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<InspectionItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption,  bool isLoadingForms,  List<InspectionFormItem> forms,  Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption,  bool isLoadingFormsAvailable,  List<InspectionFormAvailableItem> formsAvailable,  Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption,  bool isCreating,  Option<Either<GlobalFailure, InspectionDetail>> createResultOption)  $default,) {final _that = this;
switch (_that) {
case _InspectionsState():
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.isLoadingForms,_that.forms,_that.formsResultOption,_that.isLoadingFormsAvailable,_that.formsAvailable,_that.formsAvailableResultOption,_that.isCreating,_that.createResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<InspectionItem>? items,  int currentPage,  int perPage,  int total,  bool canLoadMore,  Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption,  bool isLoadingForms,  List<InspectionFormItem> forms,  Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption,  bool isLoadingFormsAvailable,  List<InspectionFormAvailableItem> formsAvailable,  Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption,  bool isCreating,  Option<Either<GlobalFailure, InspectionDetail>> createResultOption)?  $default,) {final _that = this;
switch (_that) {
case _InspectionsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.currentPage,_that.perPage,_that.total,_that.canLoadMore,_that.resultOption,_that.isLoadingForms,_that.forms,_that.formsResultOption,_that.isLoadingFormsAvailable,_that.formsAvailable,_that.formsAvailableResultOption,_that.isCreating,_that.createResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _InspectionsState implements InspectionsState {
  const _InspectionsState({required this.isLoading, required final  List<InspectionItem>? items, required this.currentPage, required this.perPage, required this.total, required this.canLoadMore, required this.resultOption, required this.isLoadingForms, required final  List<InspectionFormItem> forms, required this.formsResultOption, required this.isLoadingFormsAvailable, required final  List<InspectionFormAvailableItem> formsAvailable, required this.formsAvailableResultOption, required this.isCreating, required this.createResultOption}): _items = items,_forms = forms,_formsAvailable = formsAvailable;
  

@override final  bool isLoading;
 final  List<InspectionItem>? _items;
@override List<InspectionItem>? get items {
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
@override final  Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption;
// Inspection forms list (non-paginated)
@override final  bool isLoadingForms;
 final  List<InspectionFormItem> _forms;
@override List<InspectionFormItem> get forms {
  if (_forms is EqualUnmodifiableListView) return _forms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forms);
}

@override final  Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption;
// Available forms (with possible ongoing inspection id)
@override final  bool isLoadingFormsAvailable;
 final  List<InspectionFormAvailableItem> _formsAvailable;
@override List<InspectionFormAvailableItem> get formsAvailable {
  if (_formsAvailable is EqualUnmodifiableListView) return _formsAvailable;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formsAvailable);
}

@override final  Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption;
// Create inspection
@override final  bool isCreating;
@override final  Option<Either<GlobalFailure, InspectionDetail>> createResultOption;

/// Create a copy of InspectionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionsStateCopyWith<_InspectionsState> get copyWith => __$InspectionsStateCopyWithImpl<_InspectionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingForms, isLoadingForms) || other.isLoadingForms == isLoadingForms)&&const DeepCollectionEquality().equals(other._forms, _forms)&&(identical(other.formsResultOption, formsResultOption) || other.formsResultOption == formsResultOption)&&(identical(other.isLoadingFormsAvailable, isLoadingFormsAvailable) || other.isLoadingFormsAvailable == isLoadingFormsAvailable)&&const DeepCollectionEquality().equals(other._formsAvailable, _formsAvailable)&&(identical(other.formsAvailableResultOption, formsAvailableResultOption) || other.formsAvailableResultOption == formsAvailableResultOption)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.createResultOption, createResultOption) || other.createResultOption == createResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),currentPage,perPage,total,canLoadMore,resultOption,isLoadingForms,const DeepCollectionEquality().hash(_forms),formsResultOption,isLoadingFormsAvailable,const DeepCollectionEquality().hash(_formsAvailable),formsAvailableResultOption,isCreating,createResultOption);

@override
String toString() {
  return 'InspectionsState(isLoading: $isLoading, items: $items, currentPage: $currentPage, perPage: $perPage, total: $total, canLoadMore: $canLoadMore, resultOption: $resultOption, isLoadingForms: $isLoadingForms, forms: $forms, formsResultOption: $formsResultOption, isLoadingFormsAvailable: $isLoadingFormsAvailable, formsAvailable: $formsAvailable, formsAvailableResultOption: $formsAvailableResultOption, isCreating: $isCreating, createResultOption: $createResultOption)';
}


}

/// @nodoc
abstract mixin class _$InspectionsStateCopyWith<$Res> implements $InspectionsStateCopyWith<$Res> {
  factory _$InspectionsStateCopyWith(_InspectionsState value, $Res Function(_InspectionsState) _then) = __$InspectionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<InspectionItem>? items, int currentPage, int perPage, int total, bool canLoadMore, Option<Either<GlobalFailure, Paginated<InspectionItem>>> resultOption, bool isLoadingForms, List<InspectionFormItem> forms, Option<Either<GlobalFailure, List<InspectionFormItem>>> formsResultOption, bool isLoadingFormsAvailable, List<InspectionFormAvailableItem> formsAvailable, Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>> formsAvailableResultOption, bool isCreating, Option<Either<GlobalFailure, InspectionDetail>> createResultOption
});




}
/// @nodoc
class __$InspectionsStateCopyWithImpl<$Res>
    implements _$InspectionsStateCopyWith<$Res> {
  __$InspectionsStateCopyWithImpl(this._self, this._then);

  final _InspectionsState _self;
  final $Res Function(_InspectionsState) _then;

/// Create a copy of InspectionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = freezed,Object? currentPage = null,Object? perPage = null,Object? total = null,Object? canLoadMore = null,Object? resultOption = null,Object? isLoadingForms = null,Object? forms = null,Object? formsResultOption = null,Object? isLoadingFormsAvailable = null,Object? formsAvailable = null,Object? formsAvailableResultOption = null,Object? isCreating = null,Object? createResultOption = null,}) {
  return _then(_InspectionsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InspectionItem>?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<InspectionItem>>>,isLoadingForms: null == isLoadingForms ? _self.isLoadingForms : isLoadingForms // ignore: cast_nullable_to_non_nullable
as bool,forms: null == forms ? _self._forms : forms // ignore: cast_nullable_to_non_nullable
as List<InspectionFormItem>,formsResultOption: null == formsResultOption ? _self.formsResultOption : formsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionFormItem>>>,isLoadingFormsAvailable: null == isLoadingFormsAvailable ? _self.isLoadingFormsAvailable : isLoadingFormsAvailable // ignore: cast_nullable_to_non_nullable
as bool,formsAvailable: null == formsAvailable ? _self._formsAvailable : formsAvailable // ignore: cast_nullable_to_non_nullable
as List<InspectionFormAvailableItem>,formsAvailableResultOption: null == formsAvailableResultOption ? _self.formsAvailableResultOption : formsAvailableResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,createResultOption: null == createResultOption ? _self.createResultOption : createResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, InspectionDetail>>,
  ));
}


}

// dart format on
