// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionDetailEvent()';
}


}

/// @nodoc
class $ActionDetailEventCopyWith<$Res>  {
$ActionDetailEventCopyWith(ActionDetailEvent _, $Res Function(ActionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ActionDetailEvent].
extension ActionDetailEventPatterns on ActionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _RequestValidation value)?  requestValidation,TResult Function( _RequestRevision value)?  requestRevision,TResult Function( _SubmitRevision value)?  submitRevision,TResult Function( _PrintRequested value)?  printRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _RequestValidation() when requestValidation != null:
return requestValidation(_that);case _RequestRevision() when requestRevision != null:
return requestRevision(_that);case _SubmitRevision() when submitRevision != null:
return submitRevision(_that);case _PrintRequested() when printRequested != null:
return printRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _RequestValidation value)  requestValidation,required TResult Function( _RequestRevision value)  requestRevision,required TResult Function( _SubmitRevision value)  submitRevision,required TResult Function( _PrintRequested value)  printRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _RequestValidation():
return requestValidation(_that);case _RequestRevision():
return requestRevision(_that);case _SubmitRevision():
return submitRevision(_that);case _PrintRequested():
return printRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _RequestValidation value)?  requestValidation,TResult? Function( _RequestRevision value)?  requestRevision,TResult? Function( _SubmitRevision value)?  submitRevision,TResult? Function( _PrintRequested value)?  printRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _RequestValidation() when requestValidation != null:
return requestValidation(_that);case _RequestRevision() when requestRevision != null:
return requestRevision(_that);case _SubmitRevision() when submitRevision != null:
return submitRevision(_that);case _PrintRequested() when printRequested != null:
return printRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchRequested,TResult Function()?  reset,TResult Function( int id,  String? comment)?  requestValidation,TResult Function( int id)?  requestRevision,TResult Function( int id,  String? revisionComment)?  submitRevision,TResult Function( int id)?  printRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _RequestValidation() when requestValidation != null:
return requestValidation(_that.id,_that.comment);case _RequestRevision() when requestRevision != null:
return requestRevision(_that.id);case _SubmitRevision() when submitRevision != null:
return submitRevision(_that.id,_that.revisionComment);case _PrintRequested() when printRequested != null:
return printRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchRequested,required TResult Function()  reset,required TResult Function( int id,  String? comment)  requestValidation,required TResult Function( int id)  requestRevision,required TResult Function( int id,  String? revisionComment)  submitRevision,required TResult Function( int id)  printRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.id);case _Reset():
return reset();case _RequestValidation():
return requestValidation(_that.id,_that.comment);case _RequestRevision():
return requestRevision(_that.id);case _SubmitRevision():
return submitRevision(_that.id,_that.revisionComment);case _PrintRequested():
return printRequested(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchRequested,TResult? Function()?  reset,TResult? Function( int id,  String? comment)?  requestValidation,TResult? Function( int id)?  requestRevision,TResult? Function( int id,  String? revisionComment)?  submitRevision,TResult? Function( int id)?  printRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _RequestValidation() when requestValidation != null:
return requestValidation(_that.id,_that.comment);case _RequestRevision() when requestRevision != null:
return requestRevision(_that.id);case _SubmitRevision() when submitRevision != null:
return submitRevision(_that.id,_that.revisionComment);case _PrintRequested() when printRequested != null:
return printRequested(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements ActionDetailEvent {
  const _FetchRequested({required this.id});
  

 final  int id;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchRequestedCopyWith<_FetchRequested> get copyWith => __$FetchRequestedCopyWithImpl<_FetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ActionDetailEvent.fetchRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $ActionDetailEventCopyWith<$Res> {
  factory _$FetchRequestedCopyWith(_FetchRequested value, $Res Function(_FetchRequested) _then) = __$FetchRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchRequestedCopyWithImpl<$Res>
    implements _$FetchRequestedCopyWith<$Res> {
  __$FetchRequestedCopyWithImpl(this._self, this._then);

  final _FetchRequested _self;
  final $Res Function(_FetchRequested) _then;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements ActionDetailEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionDetailEvent.reset()';
}


}




/// @nodoc


class _RequestValidation implements ActionDetailEvent {
  const _RequestValidation({required this.id, this.comment});
  

 final  int id;
 final  String? comment;

/// Create a copy of ActionDetailEvent
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
  return 'ActionDetailEvent.requestValidation(id: $id, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$RequestValidationCopyWith<$Res> implements $ActionDetailEventCopyWith<$Res> {
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

/// Create a copy of ActionDetailEvent
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


class _RequestRevision implements ActionDetailEvent {
  const _RequestRevision({required this.id});
  

 final  int id;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestRevisionCopyWith<_RequestRevision> get copyWith => __$RequestRevisionCopyWithImpl<_RequestRevision>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestRevision&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ActionDetailEvent.requestRevision(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RequestRevisionCopyWith<$Res> implements $ActionDetailEventCopyWith<$Res> {
  factory _$RequestRevisionCopyWith(_RequestRevision value, $Res Function(_RequestRevision) _then) = __$RequestRevisionCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$RequestRevisionCopyWithImpl<$Res>
    implements _$RequestRevisionCopyWith<$Res> {
  __$RequestRevisionCopyWithImpl(this._self, this._then);

  final _RequestRevision _self;
  final $Res Function(_RequestRevision) _then;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RequestRevision(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SubmitRevision implements ActionDetailEvent {
  const _SubmitRevision({required this.id, this.revisionComment});
  

 final  int id;
 final  String? revisionComment;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitRevisionCopyWith<_SubmitRevision> get copyWith => __$SubmitRevisionCopyWithImpl<_SubmitRevision>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitRevision&&(identical(other.id, id) || other.id == id)&&(identical(other.revisionComment, revisionComment) || other.revisionComment == revisionComment));
}


@override
int get hashCode => Object.hash(runtimeType,id,revisionComment);

@override
String toString() {
  return 'ActionDetailEvent.submitRevision(id: $id, revisionComment: $revisionComment)';
}


}

/// @nodoc
abstract mixin class _$SubmitRevisionCopyWith<$Res> implements $ActionDetailEventCopyWith<$Res> {
  factory _$SubmitRevisionCopyWith(_SubmitRevision value, $Res Function(_SubmitRevision) _then) = __$SubmitRevisionCopyWithImpl;
@useResult
$Res call({
 int id, String? revisionComment
});




}
/// @nodoc
class __$SubmitRevisionCopyWithImpl<$Res>
    implements _$SubmitRevisionCopyWith<$Res> {
  __$SubmitRevisionCopyWithImpl(this._self, this._then);

  final _SubmitRevision _self;
  final $Res Function(_SubmitRevision) _then;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? revisionComment = freezed,}) {
  return _then(_SubmitRevision(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,revisionComment: freezed == revisionComment ? _self.revisionComment : revisionComment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _PrintRequested implements ActionDetailEvent {
  const _PrintRequested({required this.id});
  

 final  int id;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintRequestedCopyWith<_PrintRequested> get copyWith => __$PrintRequestedCopyWithImpl<_PrintRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrintRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ActionDetailEvent.printRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PrintRequestedCopyWith<$Res> implements $ActionDetailEventCopyWith<$Res> {
  factory _$PrintRequestedCopyWith(_PrintRequested value, $Res Function(_PrintRequested) _then) = __$PrintRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$PrintRequestedCopyWithImpl<$Res>
    implements _$PrintRequestedCopyWith<$Res> {
  __$PrintRequestedCopyWithImpl(this._self, this._then);

  final _PrintRequested _self;
  final $Res Function(_PrintRequested) _then;

/// Create a copy of ActionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_PrintRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ActionDetailState {

 bool get isLoading; ActionItem? get item; Option<Either<GlobalFailure, ActionItem>> get resultOption;
/// Create a copy of ActionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionDetailStateCopyWith<ActionDetailState> get copyWith => _$ActionDetailStateCopyWithImpl<ActionDetailState>(this as ActionDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption);

@override
String toString() {
  return 'ActionDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $ActionDetailStateCopyWith<$Res>  {
  factory $ActionDetailStateCopyWith(ActionDetailState value, $Res Function(ActionDetailState) _then) = _$ActionDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, ActionItem? item, Option<Either<GlobalFailure, ActionItem>> resultOption
});




}
/// @nodoc
class _$ActionDetailStateCopyWithImpl<$Res>
    implements $ActionDetailStateCopyWith<$Res> {
  _$ActionDetailStateCopyWithImpl(this._self, this._then);

  final ActionDetailState _self;
  final $Res Function(ActionDetailState) _then;

/// Create a copy of ActionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ActionItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, ActionItem>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionDetailState].
extension ActionDetailStatePatterns on ActionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ActionDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ActionDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  ActionItem? item,  Option<Either<GlobalFailure, ActionItem>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  ActionItem? item,  Option<Either<GlobalFailure, ActionItem>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _ActionDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  ActionItem? item,  Option<Either<GlobalFailure, ActionItem>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _ActionDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _ActionDetailState implements ActionDetailState {
  const _ActionDetailState({required this.isLoading, required this.item, required this.resultOption});
  

@override final  bool isLoading;
@override final  ActionItem? item;
@override final  Option<Either<GlobalFailure, ActionItem>> resultOption;

/// Create a copy of ActionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionDetailStateCopyWith<_ActionDetailState> get copyWith => __$ActionDetailStateCopyWithImpl<_ActionDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption);

@override
String toString() {
  return 'ActionDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$ActionDetailStateCopyWith<$Res> implements $ActionDetailStateCopyWith<$Res> {
  factory _$ActionDetailStateCopyWith(_ActionDetailState value, $Res Function(_ActionDetailState) _then) = __$ActionDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, ActionItem? item, Option<Either<GlobalFailure, ActionItem>> resultOption
});




}
/// @nodoc
class __$ActionDetailStateCopyWithImpl<$Res>
    implements _$ActionDetailStateCopyWith<$Res> {
  __$ActionDetailStateCopyWithImpl(this._self, this._then);

  final _ActionDetailState _self;
  final $Res Function(_ActionDetailState) _then;

/// Create a copy of ActionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,}) {
  return _then(_ActionDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ActionItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, ActionItem>>,
  ));
}


}

// dart format on
