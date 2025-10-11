// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaigns_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CampaignsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampaignsEvent()';
}


}

/// @nodoc
class $CampaignsEventCopyWith<$Res>  {
$CampaignsEventCopyWith(CampaignsEvent _, $Res Function(CampaignsEvent) __);
}


/// Adds pattern-matching-related methods to [CampaignsEvent].
extension CampaignsEventPatterns on CampaignsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _FetchDetailRequested value)?  fetchDetailRequested,TResult Function( _FetchActionPlansRequested value)?  fetchActionPlansRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that);case _FetchActionPlansRequested() when fetchActionPlansRequested != null:
return fetchActionPlansRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _FetchDetailRequested value)  fetchDetailRequested,required TResult Function( _FetchActionPlansRequested value)  fetchActionPlansRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _FetchDetailRequested():
return fetchDetailRequested(_that);case _FetchActionPlansRequested():
return fetchActionPlansRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _FetchDetailRequested value)?  fetchDetailRequested,TResult? Function( _FetchActionPlansRequested value)?  fetchActionPlansRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that);case _FetchActionPlansRequested() when fetchActionPlansRequested != null:
return fetchActionPlansRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,TResult Function( int id)?  fetchDetailRequested,TResult Function( int campaignId)?  fetchActionPlansRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that.id);case _FetchActionPlansRequested() when fetchActionPlansRequested != null:
return fetchActionPlansRequested(_that.campaignId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,required TResult Function( int id)  fetchDetailRequested,required TResult Function( int campaignId)  fetchActionPlansRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested();case _FetchDetailRequested():
return fetchDetailRequested(_that.id);case _FetchActionPlansRequested():
return fetchActionPlansRequested(_that.campaignId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,TResult? Function( int id)?  fetchDetailRequested,TResult? Function( int campaignId)?  fetchActionPlansRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested();case _FetchDetailRequested() when fetchDetailRequested != null:
return fetchDetailRequested(_that.id);case _FetchActionPlansRequested() when fetchActionPlansRequested != null:
return fetchActionPlansRequested(_that.campaignId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements CampaignsEvent {
  const _FetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampaignsEvent.fetchRequested()';
}


}




/// @nodoc


class _FetchDetailRequested implements CampaignsEvent {
  const _FetchDetailRequested({required this.id});
  

 final  int id;

/// Create a copy of CampaignsEvent
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
  return 'CampaignsEvent.fetchDetailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchDetailRequestedCopyWith<$Res> implements $CampaignsEventCopyWith<$Res> {
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

/// Create a copy of CampaignsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchDetailRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FetchActionPlansRequested implements CampaignsEvent {
  const _FetchActionPlansRequested({required this.campaignId});
  

 final  int campaignId;

/// Create a copy of CampaignsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchActionPlansRequestedCopyWith<_FetchActionPlansRequested> get copyWith => __$FetchActionPlansRequestedCopyWithImpl<_FetchActionPlansRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchActionPlansRequested&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId));
}


@override
int get hashCode => Object.hash(runtimeType,campaignId);

@override
String toString() {
  return 'CampaignsEvent.fetchActionPlansRequested(campaignId: $campaignId)';
}


}

/// @nodoc
abstract mixin class _$FetchActionPlansRequestedCopyWith<$Res> implements $CampaignsEventCopyWith<$Res> {
  factory _$FetchActionPlansRequestedCopyWith(_FetchActionPlansRequested value, $Res Function(_FetchActionPlansRequested) _then) = __$FetchActionPlansRequestedCopyWithImpl;
@useResult
$Res call({
 int campaignId
});




}
/// @nodoc
class __$FetchActionPlansRequestedCopyWithImpl<$Res>
    implements _$FetchActionPlansRequestedCopyWith<$Res> {
  __$FetchActionPlansRequestedCopyWithImpl(this._self, this._then);

  final _FetchActionPlansRequested _self;
  final $Res Function(_FetchActionPlansRequested) _then;

/// Create a copy of CampaignsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? campaignId = null,}) {
  return _then(_FetchActionPlansRequested(
campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CampaignsState {

// list
 bool get isLoading; List<CampaignItem> get items; Option<Either<GlobalFailure, List<CampaignItem>>> get resultOption;// detail
 bool get isDetailLoading; CampaignItem? get detail; Option<Either<GlobalFailure, CampaignItem>> get detailResultOption;// action plans
 bool get isPlansLoading; List<CommunicationActionPlan> get plans; Option<Either<GlobalFailure, List<CommunicationActionPlan>>> get plansResultOption;
/// Create a copy of CampaignsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignsStateCopyWith<CampaignsState> get copyWith => _$CampaignsStateCopyWithImpl<CampaignsState>(this as CampaignsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.detailResultOption, detailResultOption) || other.detailResultOption == detailResultOption)&&(identical(other.isPlansLoading, isPlansLoading) || other.isPlansLoading == isPlansLoading)&&const DeepCollectionEquality().equals(other.plans, plans)&&(identical(other.plansResultOption, plansResultOption) || other.plansResultOption == plansResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),resultOption,isDetailLoading,detail,detailResultOption,isPlansLoading,const DeepCollectionEquality().hash(plans),plansResultOption);

@override
String toString() {
  return 'CampaignsState(isLoading: $isLoading, items: $items, resultOption: $resultOption, isDetailLoading: $isDetailLoading, detail: $detail, detailResultOption: $detailResultOption, isPlansLoading: $isPlansLoading, plans: $plans, plansResultOption: $plansResultOption)';
}


}

/// @nodoc
abstract mixin class $CampaignsStateCopyWith<$Res>  {
  factory $CampaignsStateCopyWith(CampaignsState value, $Res Function(CampaignsState) _then) = _$CampaignsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<CampaignItem> items, Option<Either<GlobalFailure, List<CampaignItem>>> resultOption, bool isDetailLoading, CampaignItem? detail, Option<Either<GlobalFailure, CampaignItem>> detailResultOption, bool isPlansLoading, List<CommunicationActionPlan> plans, Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption
});




}
/// @nodoc
class _$CampaignsStateCopyWithImpl<$Res>
    implements $CampaignsStateCopyWith<$Res> {
  _$CampaignsStateCopyWithImpl(this._self, this._then);

  final CampaignsState _self;
  final $Res Function(CampaignsState) _then;

/// Create a copy of CampaignsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = null,Object? resultOption = null,Object? isDetailLoading = null,Object? detail = freezed,Object? detailResultOption = null,Object? isPlansLoading = null,Object? plans = null,Object? plansResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CampaignItem>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CampaignItem>>>,isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as CampaignItem?,detailResultOption: null == detailResultOption ? _self.detailResultOption : detailResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, CampaignItem>>,isPlansLoading: null == isPlansLoading ? _self.isPlansLoading : isPlansLoading // ignore: cast_nullable_to_non_nullable
as bool,plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<CommunicationActionPlan>,plansResultOption: null == plansResultOption ? _self.plansResultOption : plansResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CommunicationActionPlan>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CampaignsState].
extension CampaignsStatePatterns on CampaignsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignsState value)  $default,){
final _that = this;
switch (_that) {
case _CampaignsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignsState value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<CampaignItem> items,  Option<Either<GlobalFailure, List<CampaignItem>>> resultOption,  bool isDetailLoading,  CampaignItem? detail,  Option<Either<GlobalFailure, CampaignItem>> detailResultOption,  bool isPlansLoading,  List<CommunicationActionPlan> plans,  Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isPlansLoading,_that.plans,_that.plansResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<CampaignItem> items,  Option<Either<GlobalFailure, List<CampaignItem>>> resultOption,  bool isDetailLoading,  CampaignItem? detail,  Option<Either<GlobalFailure, CampaignItem>> detailResultOption,  bool isPlansLoading,  List<CommunicationActionPlan> plans,  Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption)  $default,) {final _that = this;
switch (_that) {
case _CampaignsState():
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isPlansLoading,_that.plans,_that.plansResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<CampaignItem> items,  Option<Either<GlobalFailure, List<CampaignItem>>> resultOption,  bool isDetailLoading,  CampaignItem? detail,  Option<Either<GlobalFailure, CampaignItem>> detailResultOption,  bool isPlansLoading,  List<CommunicationActionPlan> plans,  Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption)?  $default,) {final _that = this;
switch (_that) {
case _CampaignsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isDetailLoading,_that.detail,_that.detailResultOption,_that.isPlansLoading,_that.plans,_that.plansResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _CampaignsState implements CampaignsState {
  const _CampaignsState({this.isLoading = false, final  List<CampaignItem> items = const <CampaignItem>[], required this.resultOption, this.isDetailLoading = false, this.detail, required this.detailResultOption, this.isPlansLoading = false, final  List<CommunicationActionPlan> plans = const <CommunicationActionPlan>[], required this.plansResultOption}): _items = items,_plans = plans;
  

// list
@override@JsonKey() final  bool isLoading;
 final  List<CampaignItem> _items;
@override@JsonKey() List<CampaignItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Option<Either<GlobalFailure, List<CampaignItem>>> resultOption;
// detail
@override@JsonKey() final  bool isDetailLoading;
@override final  CampaignItem? detail;
@override final  Option<Either<GlobalFailure, CampaignItem>> detailResultOption;
// action plans
@override@JsonKey() final  bool isPlansLoading;
 final  List<CommunicationActionPlan> _plans;
@override@JsonKey() List<CommunicationActionPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override final  Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption;

/// Create a copy of CampaignsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignsStateCopyWith<_CampaignsState> get copyWith => __$CampaignsStateCopyWithImpl<_CampaignsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.detailResultOption, detailResultOption) || other.detailResultOption == detailResultOption)&&(identical(other.isPlansLoading, isPlansLoading) || other.isPlansLoading == isPlansLoading)&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.plansResultOption, plansResultOption) || other.plansResultOption == plansResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),resultOption,isDetailLoading,detail,detailResultOption,isPlansLoading,const DeepCollectionEquality().hash(_plans),plansResultOption);

@override
String toString() {
  return 'CampaignsState(isLoading: $isLoading, items: $items, resultOption: $resultOption, isDetailLoading: $isDetailLoading, detail: $detail, detailResultOption: $detailResultOption, isPlansLoading: $isPlansLoading, plans: $plans, plansResultOption: $plansResultOption)';
}


}

/// @nodoc
abstract mixin class _$CampaignsStateCopyWith<$Res> implements $CampaignsStateCopyWith<$Res> {
  factory _$CampaignsStateCopyWith(_CampaignsState value, $Res Function(_CampaignsState) _then) = __$CampaignsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<CampaignItem> items, Option<Either<GlobalFailure, List<CampaignItem>>> resultOption, bool isDetailLoading, CampaignItem? detail, Option<Either<GlobalFailure, CampaignItem>> detailResultOption, bool isPlansLoading, List<CommunicationActionPlan> plans, Option<Either<GlobalFailure, List<CommunicationActionPlan>>> plansResultOption
});




}
/// @nodoc
class __$CampaignsStateCopyWithImpl<$Res>
    implements _$CampaignsStateCopyWith<$Res> {
  __$CampaignsStateCopyWithImpl(this._self, this._then);

  final _CampaignsState _self;
  final $Res Function(_CampaignsState) _then;

/// Create a copy of CampaignsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = null,Object? resultOption = null,Object? isDetailLoading = null,Object? detail = freezed,Object? detailResultOption = null,Object? isPlansLoading = null,Object? plans = null,Object? plansResultOption = null,}) {
  return _then(_CampaignsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CampaignItem>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CampaignItem>>>,isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as CampaignItem?,detailResultOption: null == detailResultOption ? _self.detailResultOption : detailResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, CampaignItem>>,isPlansLoading: null == isPlansLoading ? _self.isPlansLoading : isPlansLoading // ignore: cast_nullable_to_non_nullable
as bool,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<CommunicationActionPlan>,plansResultOption: null == plansResultOption ? _self.plansResultOption : plansResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CommunicationActionPlan>>>,
  ));
}


}

// dart format on
