// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InspectionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionDetailEvent()';
}


}

/// @nodoc
class $InspectionDetailEventCopyWith<$Res>  {
$InspectionDetailEventCopyWith(InspectionDetailEvent _, $Res Function(InspectionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [InspectionDetailEvent].
extension InspectionDetailEventPatterns on InspectionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _PostAnswers value)?  postAnswers,TResult Function( _AddRemark value)?  addRemark,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _PostAnswers() when postAnswers != null:
return postAnswers(_that);case _AddRemark() when addRemark != null:
return addRemark(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _PostAnswers value)  postAnswers,required TResult Function( _AddRemark value)  addRemark,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _PostAnswers():
return postAnswers(_that);case _AddRemark():
return addRemark(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _PostAnswers value)?  postAnswers,TResult? Function( _AddRemark value)?  addRemark,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _PostAnswers() when postAnswers != null:
return postAnswers(_that);case _AddRemark() when addRemark != null:
return addRemark(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetch,TResult Function( int id,  InspectionAnswersPostBody body)?  postAnswers,TResult Function( int id,  String otherRemark,  String recommendation)?  addRemark,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.id);case _PostAnswers() when postAnswers != null:
return postAnswers(_that.id,_that.body);case _AddRemark() when addRemark != null:
return addRemark(_that.id,_that.otherRemark,_that.recommendation);case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetch,required TResult Function( int id,  InspectionAnswersPostBody body)  postAnswers,required TResult Function( int id,  String otherRemark,  String recommendation)  addRemark,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.id);case _PostAnswers():
return postAnswers(_that.id,_that.body);case _AddRemark():
return addRemark(_that.id,_that.otherRemark,_that.recommendation);case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetch,TResult? Function( int id,  InspectionAnswersPostBody body)?  postAnswers,TResult? Function( int id,  String otherRemark,  String recommendation)?  addRemark,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.id);case _PostAnswers() when postAnswers != null:
return postAnswers(_that.id,_that.body);case _AddRemark() when addRemark != null:
return addRemark(_that.id,_that.otherRemark,_that.recommendation);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements InspectionDetailEvent {
  const _Fetch({required this.id});
  

 final  int id;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCopyWith<_Fetch> get copyWith => __$FetchCopyWithImpl<_Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InspectionDetailEvent.fetch(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $InspectionDetailEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) = __$FetchCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Fetch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PostAnswers implements InspectionDetailEvent {
  const _PostAnswers({required this.id, required this.body});
  

 final  int id;
 final  InspectionAnswersPostBody body;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostAnswersCopyWith<_PostAnswers> get copyWith => __$PostAnswersCopyWithImpl<_PostAnswers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostAnswers&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,id,body);

@override
String toString() {
  return 'InspectionDetailEvent.postAnswers(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$PostAnswersCopyWith<$Res> implements $InspectionDetailEventCopyWith<$Res> {
  factory _$PostAnswersCopyWith(_PostAnswers value, $Res Function(_PostAnswers) _then) = __$PostAnswersCopyWithImpl;
@useResult
$Res call({
 int id, InspectionAnswersPostBody body
});




}
/// @nodoc
class __$PostAnswersCopyWithImpl<$Res>
    implements _$PostAnswersCopyWith<$Res> {
  __$PostAnswersCopyWithImpl(this._self, this._then);

  final _PostAnswers _self;
  final $Res Function(_PostAnswers) _then;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_PostAnswers(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as InspectionAnswersPostBody,
  ));
}


}

/// @nodoc


class _AddRemark implements InspectionDetailEvent {
  const _AddRemark({required this.id, required this.otherRemark, required this.recommendation});
  

 final  int id;
 final  String otherRemark;
 final  String recommendation;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddRemarkCopyWith<_AddRemark> get copyWith => __$AddRemarkCopyWithImpl<_AddRemark>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddRemark&&(identical(other.id, id) || other.id == id)&&(identical(other.otherRemark, otherRemark) || other.otherRemark == otherRemark)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}


@override
int get hashCode => Object.hash(runtimeType,id,otherRemark,recommendation);

@override
String toString() {
  return 'InspectionDetailEvent.addRemark(id: $id, otherRemark: $otherRemark, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$AddRemarkCopyWith<$Res> implements $InspectionDetailEventCopyWith<$Res> {
  factory _$AddRemarkCopyWith(_AddRemark value, $Res Function(_AddRemark) _then) = __$AddRemarkCopyWithImpl;
@useResult
$Res call({
 int id, String otherRemark, String recommendation
});




}
/// @nodoc
class __$AddRemarkCopyWithImpl<$Res>
    implements _$AddRemarkCopyWith<$Res> {
  __$AddRemarkCopyWithImpl(this._self, this._then);

  final _AddRemark _self;
  final $Res Function(_AddRemark) _then;

/// Create a copy of InspectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? otherRemark = null,Object? recommendation = null,}) {
  return _then(_AddRemark(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,otherRemark: null == otherRemark ? _self.otherRemark : otherRemark // ignore: cast_nullable_to_non_nullable
as String,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements InspectionDetailEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionDetailEvent.reset()';
}


}




/// @nodoc
mixin _$InspectionDetailState {

 bool get isLoading; InspectionDetail? get item; Option<Either<GlobalFailure, InspectionDetail>> get resultOption; bool? get answerIsPosted; bool? get remarkIsPosted;
/// Create a copy of InspectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionDetailStateCopyWith<InspectionDetailState> get copyWith => _$InspectionDetailStateCopyWithImpl<InspectionDetailState>(this as InspectionDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.answerIsPosted, answerIsPosted) || other.answerIsPosted == answerIsPosted)&&(identical(other.remarkIsPosted, remarkIsPosted) || other.remarkIsPosted == remarkIsPosted));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,answerIsPosted,remarkIsPosted);

@override
String toString() {
  return 'InspectionDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, answerIsPosted: $answerIsPosted, remarkIsPosted: $remarkIsPosted)';
}


}

/// @nodoc
abstract mixin class $InspectionDetailStateCopyWith<$Res>  {
  factory $InspectionDetailStateCopyWith(InspectionDetailState value, $Res Function(InspectionDetailState) _then) = _$InspectionDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, InspectionDetail? item, Option<Either<GlobalFailure, InspectionDetail>> resultOption, bool? answerIsPosted, bool? remarkIsPosted
});




}
/// @nodoc
class _$InspectionDetailStateCopyWithImpl<$Res>
    implements $InspectionDetailStateCopyWith<$Res> {
  _$InspectionDetailStateCopyWithImpl(this._self, this._then);

  final InspectionDetailState _self;
  final $Res Function(InspectionDetailState) _then;

/// Create a copy of InspectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? answerIsPosted = freezed,Object? remarkIsPosted = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InspectionDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, InspectionDetail>>,answerIsPosted: freezed == answerIsPosted ? _self.answerIsPosted : answerIsPosted // ignore: cast_nullable_to_non_nullable
as bool?,remarkIsPosted: freezed == remarkIsPosted ? _self.remarkIsPosted : remarkIsPosted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [InspectionDetailState].
extension InspectionDetailStatePatterns on InspectionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectionDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectionDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectionDetailState value)  $default,){
final _that = this;
switch (_that) {
case _InspectionDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectionDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _InspectionDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  InspectionDetail? item,  Option<Either<GlobalFailure, InspectionDetail>> resultOption,  bool? answerIsPosted,  bool? remarkIsPosted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectionDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.answerIsPosted,_that.remarkIsPosted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  InspectionDetail? item,  Option<Either<GlobalFailure, InspectionDetail>> resultOption,  bool? answerIsPosted,  bool? remarkIsPosted)  $default,) {final _that = this;
switch (_that) {
case _InspectionDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption,_that.answerIsPosted,_that.remarkIsPosted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  InspectionDetail? item,  Option<Either<GlobalFailure, InspectionDetail>> resultOption,  bool? answerIsPosted,  bool? remarkIsPosted)?  $default,) {final _that = this;
switch (_that) {
case _InspectionDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.answerIsPosted,_that.remarkIsPosted);case _:
  return null;

}
}

}

/// @nodoc


class _InspectionDetailState implements InspectionDetailState {
  const _InspectionDetailState({required this.isLoading, required this.item, required this.resultOption, this.answerIsPosted, this.remarkIsPosted});
  

@override final  bool isLoading;
@override final  InspectionDetail? item;
@override final  Option<Either<GlobalFailure, InspectionDetail>> resultOption;
@override final  bool? answerIsPosted;
@override final  bool? remarkIsPosted;

/// Create a copy of InspectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionDetailStateCopyWith<_InspectionDetailState> get copyWith => __$InspectionDetailStateCopyWithImpl<_InspectionDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectionDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.answerIsPosted, answerIsPosted) || other.answerIsPosted == answerIsPosted)&&(identical(other.remarkIsPosted, remarkIsPosted) || other.remarkIsPosted == remarkIsPosted));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,answerIsPosted,remarkIsPosted);

@override
String toString() {
  return 'InspectionDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, answerIsPosted: $answerIsPosted, remarkIsPosted: $remarkIsPosted)';
}


}

/// @nodoc
abstract mixin class _$InspectionDetailStateCopyWith<$Res> implements $InspectionDetailStateCopyWith<$Res> {
  factory _$InspectionDetailStateCopyWith(_InspectionDetailState value, $Res Function(_InspectionDetailState) _then) = __$InspectionDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, InspectionDetail? item, Option<Either<GlobalFailure, InspectionDetail>> resultOption, bool? answerIsPosted, bool? remarkIsPosted
});




}
/// @nodoc
class __$InspectionDetailStateCopyWithImpl<$Res>
    implements _$InspectionDetailStateCopyWith<$Res> {
  __$InspectionDetailStateCopyWithImpl(this._self, this._then);

  final _InspectionDetailState _self;
  final $Res Function(_InspectionDetailState) _then;

/// Create a copy of InspectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? answerIsPosted = freezed,Object? remarkIsPosted = freezed,}) {
  return _then(_InspectionDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InspectionDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, InspectionDetail>>,answerIsPosted: freezed == answerIsPosted ? _self.answerIsPosted : answerIsPosted // ignore: cast_nullable_to_non_nullable
as bool?,remarkIsPosted: freezed == remarkIsPosted ? _self.remarkIsPosted : remarkIsPosted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
