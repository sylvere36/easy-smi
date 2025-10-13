// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventDetailsEvent()';
}


}

/// @nodoc
class $EventDetailsEventCopyWith<$Res>  {
$EventDetailsEventCopyWith(EventDetailsEvent _, $Res Function(EventDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [EventDetailsEvent].
extension EventDetailsEventPatterns on EventDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetEventDetail value)?  getEvent,TResult Function( _Reset value)?  reset,TResult Function( _RequestValidation value)?  requestValidation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetEventDetail() when getEvent != null:
return getEvent(_that);case _Reset() when reset != null:
return reset(_that);case _RequestValidation() when requestValidation != null:
return requestValidation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetEventDetail value)  getEvent,required TResult Function( _Reset value)  reset,required TResult Function( _RequestValidation value)  requestValidation,}){
final _that = this;
switch (_that) {
case _GetEventDetail():
return getEvent(_that);case _Reset():
return reset(_that);case _RequestValidation():
return requestValidation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetEventDetail value)?  getEvent,TResult? Function( _Reset value)?  reset,TResult? Function( _RequestValidation value)?  requestValidation,}){
final _that = this;
switch (_that) {
case _GetEventDetail() when getEvent != null:
return getEvent(_that);case _Reset() when reset != null:
return reset(_that);case _RequestValidation() when requestValidation != null:
return requestValidation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EventItem event)?  getEvent,TResult Function()?  reset,TResult Function( int id,  String? comment)?  requestValidation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetEventDetail() when getEvent != null:
return getEvent(_that.event);case _Reset() when reset != null:
return reset();case _RequestValidation() when requestValidation != null:
return requestValidation(_that.id,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EventItem event)  getEvent,required TResult Function()  reset,required TResult Function( int id,  String? comment)  requestValidation,}) {final _that = this;
switch (_that) {
case _GetEventDetail():
return getEvent(_that.event);case _Reset():
return reset();case _RequestValidation():
return requestValidation(_that.id,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EventItem event)?  getEvent,TResult? Function()?  reset,TResult? Function( int id,  String? comment)?  requestValidation,}) {final _that = this;
switch (_that) {
case _GetEventDetail() when getEvent != null:
return getEvent(_that.event);case _Reset() when reset != null:
return reset();case _RequestValidation() when requestValidation != null:
return requestValidation(_that.id,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _GetEventDetail implements EventDetailsEvent {
  const _GetEventDetail({required this.event});
  

 final  EventItem event;

/// Create a copy of EventDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetEventDetailCopyWith<_GetEventDetail> get copyWith => __$GetEventDetailCopyWithImpl<_GetEventDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetEventDetail&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'EventDetailsEvent.getEvent(event: $event)';
}


}

/// @nodoc
abstract mixin class _$GetEventDetailCopyWith<$Res> implements $EventDetailsEventCopyWith<$Res> {
  factory _$GetEventDetailCopyWith(_GetEventDetail value, $Res Function(_GetEventDetail) _then) = __$GetEventDetailCopyWithImpl;
@useResult
$Res call({
 EventItem event
});




}
/// @nodoc
class __$GetEventDetailCopyWithImpl<$Res>
    implements _$GetEventDetailCopyWith<$Res> {
  __$GetEventDetailCopyWithImpl(this._self, this._then);

  final _GetEventDetail _self;
  final $Res Function(_GetEventDetail) _then;

/// Create a copy of EventDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(_GetEventDetail(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventItem,
  ));
}


}

/// @nodoc


class _Reset implements EventDetailsEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventDetailsEvent.reset()';
}


}




/// @nodoc


class _RequestValidation implements EventDetailsEvent {
  const _RequestValidation({required this.id, this.comment});
  

 final  int id;
 final  String? comment;

/// Create a copy of EventDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestValidationCopyWith<_RequestValidation> get copyWith => __$RequestValidationCopyWithImpl<_RequestValidation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestValidation&&(identical(other.id, id) || other.id == id)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,comment);

@override
String toString() {
  return 'EventDetailsEvent.requestValidation(id: $id, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$RequestValidationCopyWith<$Res> implements $EventDetailsEventCopyWith<$Res> {
  factory _$RequestValidationCopyWith(_RequestValidation value, $Res Function(_RequestValidation) _then) = __$RequestValidationCopyWithImpl;
@useResult
$Res call({
 int id, String? comment
});




}
/// @nodoc
class __$RequestValidationCopyWithImpl<$Res>
    implements _$RequestValidationCopyWith<$Res> {
  __$RequestValidationCopyWithImpl(this._self, this._then);

  final _RequestValidation _self;
  final $Res Function(_RequestValidation) _then;

/// Create a copy of EventDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? comment = freezed,}) {
  return _then(_RequestValidation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$EventDetailState {

 bool get isLoading; bool get isLoadingValidation; EventItem? get item; List<CauseAnalysis>? get causes; bool? get validationIsRequested; Option<Either<GlobalFailure, List<CauseAnalysis>>> get resultOption;
/// Create a copy of EventDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDetailStateCopyWith<EventDetailState> get copyWith => _$EventDetailStateCopyWithImpl<EventDetailState>(this as EventDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingValidation, isLoadingValidation) || other.isLoadingValidation == isLoadingValidation)&&(identical(other.item, item) || other.item == item)&&const DeepCollectionEquality().equals(other.causes, causes)&&(identical(other.validationIsRequested, validationIsRequested) || other.validationIsRequested == validationIsRequested)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingValidation,item,const DeepCollectionEquality().hash(causes),validationIsRequested,resultOption);

@override
String toString() {
  return 'EventDetailState(isLoading: $isLoading, isLoadingValidation: $isLoadingValidation, item: $item, causes: $causes, validationIsRequested: $validationIsRequested, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $EventDetailStateCopyWith<$Res>  {
  factory $EventDetailStateCopyWith(EventDetailState value, $Res Function(EventDetailState) _then) = _$EventDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isLoadingValidation, EventItem? item, List<CauseAnalysis>? causes, bool? validationIsRequested, Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption
});




}
/// @nodoc
class _$EventDetailStateCopyWithImpl<$Res>
    implements $EventDetailStateCopyWith<$Res> {
  _$EventDetailStateCopyWithImpl(this._self, this._then);

  final EventDetailState _self;
  final $Res Function(EventDetailState) _then;

/// Create a copy of EventDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isLoadingValidation = null,Object? item = freezed,Object? causes = freezed,Object? validationIsRequested = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingValidation: null == isLoadingValidation ? _self.isLoadingValidation : isLoadingValidation // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as EventItem?,causes: freezed == causes ? _self.causes : causes // ignore: cast_nullable_to_non_nullable
as List<CauseAnalysis>?,validationIsRequested: freezed == validationIsRequested ? _self.validationIsRequested : validationIsRequested // ignore: cast_nullable_to_non_nullable
as bool?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CauseAnalysis>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [EventDetailState].
extension EventDetailStatePatterns on EventDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDetailState value)  $default,){
final _that = this;
switch (_that) {
case _EventDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _EventDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingValidation,  EventItem? item,  List<CauseAnalysis>? causes,  bool? validationIsRequested,  Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDetailState() when $default != null:
return $default(_that.isLoading,_that.isLoadingValidation,_that.item,_that.causes,_that.validationIsRequested,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingValidation,  EventItem? item,  List<CauseAnalysis>? causes,  bool? validationIsRequested,  Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _EventDetailState():
return $default(_that.isLoading,_that.isLoadingValidation,_that.item,_that.causes,_that.validationIsRequested,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isLoadingValidation,  EventItem? item,  List<CauseAnalysis>? causes,  bool? validationIsRequested,  Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _EventDetailState() when $default != null:
return $default(_that.isLoading,_that.isLoadingValidation,_that.item,_that.causes,_that.validationIsRequested,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _EventDetailState implements EventDetailState {
  const _EventDetailState({required this.isLoading, required this.isLoadingValidation, required this.item, required final  List<CauseAnalysis>? causes, this.validationIsRequested, required this.resultOption}): _causes = causes;
  

@override final  bool isLoading;
@override final  bool isLoadingValidation;
@override final  EventItem? item;
 final  List<CauseAnalysis>? _causes;
@override List<CauseAnalysis>? get causes {
  final value = _causes;
  if (value == null) return null;
  if (_causes is EqualUnmodifiableListView) return _causes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? validationIsRequested;
@override final  Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption;

/// Create a copy of EventDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDetailStateCopyWith<_EventDetailState> get copyWith => __$EventDetailStateCopyWithImpl<_EventDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingValidation, isLoadingValidation) || other.isLoadingValidation == isLoadingValidation)&&(identical(other.item, item) || other.item == item)&&const DeepCollectionEquality().equals(other._causes, _causes)&&(identical(other.validationIsRequested, validationIsRequested) || other.validationIsRequested == validationIsRequested)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingValidation,item,const DeepCollectionEquality().hash(_causes),validationIsRequested,resultOption);

@override
String toString() {
  return 'EventDetailState(isLoading: $isLoading, isLoadingValidation: $isLoadingValidation, item: $item, causes: $causes, validationIsRequested: $validationIsRequested, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$EventDetailStateCopyWith<$Res> implements $EventDetailStateCopyWith<$Res> {
  factory _$EventDetailStateCopyWith(_EventDetailState value, $Res Function(_EventDetailState) _then) = __$EventDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isLoadingValidation, EventItem? item, List<CauseAnalysis>? causes, bool? validationIsRequested, Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption
});




}
/// @nodoc
class __$EventDetailStateCopyWithImpl<$Res>
    implements _$EventDetailStateCopyWith<$Res> {
  __$EventDetailStateCopyWithImpl(this._self, this._then);

  final _EventDetailState _self;
  final $Res Function(_EventDetailState) _then;

/// Create a copy of EventDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isLoadingValidation = null,Object? item = freezed,Object? causes = freezed,Object? validationIsRequested = freezed,Object? resultOption = null,}) {
  return _then(_EventDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingValidation: null == isLoadingValidation ? _self.isLoadingValidation : isLoadingValidation // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as EventItem?,causes: freezed == causes ? _self._causes : causes // ignore: cast_nullable_to_non_nullable
as List<CauseAnalysis>?,validationIsRequested: freezed == validationIsRequested ? _self.validationIsRequested : validationIsRequested // ignore: cast_nullable_to_non_nullable
as bool?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CauseAnalysis>>>,
  ));
}


}

// dart format on
