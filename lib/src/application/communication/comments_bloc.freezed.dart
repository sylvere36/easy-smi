// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentsEvent()';
}


}

/// @nodoc
class $CommentsEventCopyWith<$Res>  {
$CommentsEventCopyWith(CommentsEvent _, $Res Function(CommentsEvent) __);
}


/// Adds pattern-matching-related methods to [CommentsEvent].
extension CommentsEventPatterns on CommentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _AddCommentRequested value)?  addCommentRequested,TResult Function( _AddReactionRequested value)?  addReactionRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AddCommentRequested() when addCommentRequested != null:
return addCommentRequested(_that);case _AddReactionRequested() when addReactionRequested != null:
return addReactionRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _AddCommentRequested value)  addCommentRequested,required TResult Function( _AddReactionRequested value)  addReactionRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _RefreshRequested():
return refreshRequested(_that);case _AddCommentRequested():
return addCommentRequested(_that);case _AddReactionRequested():
return addReactionRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _AddCommentRequested value)?  addCommentRequested,TResult? Function( _AddReactionRequested value)?  addReactionRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AddCommentRequested() when addCommentRequested != null:
return addCommentRequested(_that);case _AddReactionRequested() when addReactionRequested != null:
return addReactionRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String commentableType,  int commentableId)?  fetchRequested,TResult Function( String commentableType,  int commentableId)?  refreshRequested,TResult Function( String body,  String? memo,  String commentableType,  int commentableId,  String? attachmentPath,  int? parentId)?  addCommentRequested,TResult Function( int commentId,  String reaction)?  addReactionRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.commentableType,_that.commentableId);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that.commentableType,_that.commentableId);case _AddCommentRequested() when addCommentRequested != null:
return addCommentRequested(_that.body,_that.memo,_that.commentableType,_that.commentableId,_that.attachmentPath,_that.parentId);case _AddReactionRequested() when addReactionRequested != null:
return addReactionRequested(_that.commentId,_that.reaction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String commentableType,  int commentableId)  fetchRequested,required TResult Function( String commentableType,  int commentableId)  refreshRequested,required TResult Function( String body,  String? memo,  String commentableType,  int commentableId,  String? attachmentPath,  int? parentId)  addCommentRequested,required TResult Function( int commentId,  String reaction)  addReactionRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.commentableType,_that.commentableId);case _RefreshRequested():
return refreshRequested(_that.commentableType,_that.commentableId);case _AddCommentRequested():
return addCommentRequested(_that.body,_that.memo,_that.commentableType,_that.commentableId,_that.attachmentPath,_that.parentId);case _AddReactionRequested():
return addReactionRequested(_that.commentId,_that.reaction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String commentableType,  int commentableId)?  fetchRequested,TResult? Function( String commentableType,  int commentableId)?  refreshRequested,TResult? Function( String body,  String? memo,  String commentableType,  int commentableId,  String? attachmentPath,  int? parentId)?  addCommentRequested,TResult? Function( int commentId,  String reaction)?  addReactionRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.commentableType,_that.commentableId);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that.commentableType,_that.commentableId);case _AddCommentRequested() when addCommentRequested != null:
return addCommentRequested(_that.body,_that.memo,_that.commentableType,_that.commentableId,_that.attachmentPath,_that.parentId);case _AddReactionRequested() when addReactionRequested != null:
return addReactionRequested(_that.commentId,_that.reaction);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements CommentsEvent {
  const _FetchRequested({required this.commentableType, required this.commentableId});
  

 final  String commentableType;
 final  int commentableId;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchRequestedCopyWith<_FetchRequested> get copyWith => __$FetchRequestedCopyWithImpl<_FetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRequested&&(identical(other.commentableType, commentableType) || other.commentableType == commentableType)&&(identical(other.commentableId, commentableId) || other.commentableId == commentableId));
}


@override
int get hashCode => Object.hash(runtimeType,commentableType,commentableId);

@override
String toString() {
  return 'CommentsEvent.fetchRequested(commentableType: $commentableType, commentableId: $commentableId)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$FetchRequestedCopyWith(_FetchRequested value, $Res Function(_FetchRequested) _then) = __$FetchRequestedCopyWithImpl;
@useResult
$Res call({
 String commentableType, int commentableId
});




}
/// @nodoc
class __$FetchRequestedCopyWithImpl<$Res>
    implements _$FetchRequestedCopyWith<$Res> {
  __$FetchRequestedCopyWithImpl(this._self, this._then);

  final _FetchRequested _self;
  final $Res Function(_FetchRequested) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentableType = null,Object? commentableId = null,}) {
  return _then(_FetchRequested(
commentableType: null == commentableType ? _self.commentableType : commentableType // ignore: cast_nullable_to_non_nullable
as String,commentableId: null == commentableId ? _self.commentableId : commentableId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RefreshRequested implements CommentsEvent {
  const _RefreshRequested({required this.commentableType, required this.commentableId});
  

 final  String commentableType;
 final  int commentableId;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshRequestedCopyWith<_RefreshRequested> get copyWith => __$RefreshRequestedCopyWithImpl<_RefreshRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested&&(identical(other.commentableType, commentableType) || other.commentableType == commentableType)&&(identical(other.commentableId, commentableId) || other.commentableId == commentableId));
}


@override
int get hashCode => Object.hash(runtimeType,commentableType,commentableId);

@override
String toString() {
  return 'CommentsEvent.refreshRequested(commentableType: $commentableType, commentableId: $commentableId)';
}


}

/// @nodoc
abstract mixin class _$RefreshRequestedCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$RefreshRequestedCopyWith(_RefreshRequested value, $Res Function(_RefreshRequested) _then) = __$RefreshRequestedCopyWithImpl;
@useResult
$Res call({
 String commentableType, int commentableId
});




}
/// @nodoc
class __$RefreshRequestedCopyWithImpl<$Res>
    implements _$RefreshRequestedCopyWith<$Res> {
  __$RefreshRequestedCopyWithImpl(this._self, this._then);

  final _RefreshRequested _self;
  final $Res Function(_RefreshRequested) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentableType = null,Object? commentableId = null,}) {
  return _then(_RefreshRequested(
commentableType: null == commentableType ? _self.commentableType : commentableType // ignore: cast_nullable_to_non_nullable
as String,commentableId: null == commentableId ? _self.commentableId : commentableId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddCommentRequested implements CommentsEvent {
  const _AddCommentRequested({required this.body, this.memo, required this.commentableType, required this.commentableId, this.attachmentPath, this.parentId});
  

 final  String body;
 final  String? memo;
 final  String commentableType;
 final  int commentableId;
 final  String? attachmentPath;
 final  int? parentId;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCommentRequestedCopyWith<_AddCommentRequested> get copyWith => __$AddCommentRequestedCopyWithImpl<_AddCommentRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCommentRequested&&(identical(other.body, body) || other.body == body)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.commentableType, commentableType) || other.commentableType == commentableType)&&(identical(other.commentableId, commentableId) || other.commentableId == commentableId)&&(identical(other.attachmentPath, attachmentPath) || other.attachmentPath == attachmentPath)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,body,memo,commentableType,commentableId,attachmentPath,parentId);

@override
String toString() {
  return 'CommentsEvent.addCommentRequested(body: $body, memo: $memo, commentableType: $commentableType, commentableId: $commentableId, attachmentPath: $attachmentPath, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$AddCommentRequestedCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$AddCommentRequestedCopyWith(_AddCommentRequested value, $Res Function(_AddCommentRequested) _then) = __$AddCommentRequestedCopyWithImpl;
@useResult
$Res call({
 String body, String? memo, String commentableType, int commentableId, String? attachmentPath, int? parentId
});




}
/// @nodoc
class __$AddCommentRequestedCopyWithImpl<$Res>
    implements _$AddCommentRequestedCopyWith<$Res> {
  __$AddCommentRequestedCopyWithImpl(this._self, this._then);

  final _AddCommentRequested _self;
  final $Res Function(_AddCommentRequested) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,Object? memo = freezed,Object? commentableType = null,Object? commentableId = null,Object? attachmentPath = freezed,Object? parentId = freezed,}) {
  return _then(_AddCommentRequested(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,commentableType: null == commentableType ? _self.commentableType : commentableType // ignore: cast_nullable_to_non_nullable
as String,commentableId: null == commentableId ? _self.commentableId : commentableId // ignore: cast_nullable_to_non_nullable
as int,attachmentPath: freezed == attachmentPath ? _self.attachmentPath : attachmentPath // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _AddReactionRequested implements CommentsEvent {
  const _AddReactionRequested({required this.commentId, required this.reaction});
  

 final  int commentId;
 final  String reaction;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddReactionRequestedCopyWith<_AddReactionRequested> get copyWith => __$AddReactionRequestedCopyWithImpl<_AddReactionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddReactionRequested&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.reaction, reaction) || other.reaction == reaction));
}


@override
int get hashCode => Object.hash(runtimeType,commentId,reaction);

@override
String toString() {
  return 'CommentsEvent.addReactionRequested(commentId: $commentId, reaction: $reaction)';
}


}

/// @nodoc
abstract mixin class _$AddReactionRequestedCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$AddReactionRequestedCopyWith(_AddReactionRequested value, $Res Function(_AddReactionRequested) _then) = __$AddReactionRequestedCopyWithImpl;
@useResult
$Res call({
 int commentId, String reaction
});




}
/// @nodoc
class __$AddReactionRequestedCopyWithImpl<$Res>
    implements _$AddReactionRequestedCopyWith<$Res> {
  __$AddReactionRequestedCopyWithImpl(this._self, this._then);

  final _AddReactionRequested _self;
  final $Res Function(_AddReactionRequested) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentId = null,Object? reaction = null,}) {
  return _then(_AddReactionRequested(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CommentsState {

 bool get isLoading; List<CommentItem> get items; Option<Either<GlobalFailure, List<CommentItem>>> get resultOption; bool get isSubmitting; Option<Either<GlobalFailure, CommentItem>> get submitResultOption; bool get isReacting; Option<Either<GlobalFailure, Unit>> get reactionResultOption;
/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsStateCopyWith<CommentsState> get copyWith => _$CommentsStateCopyWithImpl<CommentsState>(this as CommentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitResultOption, submitResultOption) || other.submitResultOption == submitResultOption)&&(identical(other.isReacting, isReacting) || other.isReacting == isReacting)&&(identical(other.reactionResultOption, reactionResultOption) || other.reactionResultOption == reactionResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(items),resultOption,isSubmitting,submitResultOption,isReacting,reactionResultOption);

@override
String toString() {
  return 'CommentsState(isLoading: $isLoading, items: $items, resultOption: $resultOption, isSubmitting: $isSubmitting, submitResultOption: $submitResultOption, isReacting: $isReacting, reactionResultOption: $reactionResultOption)';
}


}

/// @nodoc
abstract mixin class $CommentsStateCopyWith<$Res>  {
  factory $CommentsStateCopyWith(CommentsState value, $Res Function(CommentsState) _then) = _$CommentsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<CommentItem> items, Option<Either<GlobalFailure, List<CommentItem>>> resultOption, bool isSubmitting, Option<Either<GlobalFailure, CommentItem>> submitResultOption, bool isReacting, Option<Either<GlobalFailure, Unit>> reactionResultOption
});




}
/// @nodoc
class _$CommentsStateCopyWithImpl<$Res>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._self, this._then);

  final CommentsState _self;
  final $Res Function(CommentsState) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? items = null,Object? resultOption = null,Object? isSubmitting = null,Object? submitResultOption = null,Object? isReacting = null,Object? reactionResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CommentItem>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CommentItem>>>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitResultOption: null == submitResultOption ? _self.submitResultOption : submitResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, CommentItem>>,isReacting: null == isReacting ? _self.isReacting : isReacting // ignore: cast_nullable_to_non_nullable
as bool,reactionResultOption: null == reactionResultOption ? _self.reactionResultOption : reactionResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentsState].
extension CommentsStatePatterns on CommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentsState value)  $default,){
final _that = this;
switch (_that) {
case _CommentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentsState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<CommentItem> items,  Option<Either<GlobalFailure, List<CommentItem>>> resultOption,  bool isSubmitting,  Option<Either<GlobalFailure, CommentItem>> submitResultOption,  bool isReacting,  Option<Either<GlobalFailure, Unit>> reactionResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isSubmitting,_that.submitResultOption,_that.isReacting,_that.reactionResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<CommentItem> items,  Option<Either<GlobalFailure, List<CommentItem>>> resultOption,  bool isSubmitting,  Option<Either<GlobalFailure, CommentItem>> submitResultOption,  bool isReacting,  Option<Either<GlobalFailure, Unit>> reactionResultOption)  $default,) {final _that = this;
switch (_that) {
case _CommentsState():
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isSubmitting,_that.submitResultOption,_that.isReacting,_that.reactionResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<CommentItem> items,  Option<Either<GlobalFailure, List<CommentItem>>> resultOption,  bool isSubmitting,  Option<Either<GlobalFailure, CommentItem>> submitResultOption,  bool isReacting,  Option<Either<GlobalFailure, Unit>> reactionResultOption)?  $default,) {final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
return $default(_that.isLoading,_that.items,_that.resultOption,_that.isSubmitting,_that.submitResultOption,_that.isReacting,_that.reactionResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _CommentsState implements CommentsState {
  const _CommentsState({required this.isLoading, required final  List<CommentItem> items, required this.resultOption, required this.isSubmitting, required this.submitResultOption, required this.isReacting, required this.reactionResultOption}): _items = items;
  

@override final  bool isLoading;
 final  List<CommentItem> _items;
@override List<CommentItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Option<Either<GlobalFailure, List<CommentItem>>> resultOption;
@override final  bool isSubmitting;
@override final  Option<Either<GlobalFailure, CommentItem>> submitResultOption;
@override final  bool isReacting;
@override final  Option<Either<GlobalFailure, Unit>> reactionResultOption;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsStateCopyWith<_CommentsState> get copyWith => __$CommentsStateCopyWithImpl<_CommentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitResultOption, submitResultOption) || other.submitResultOption == submitResultOption)&&(identical(other.isReacting, isReacting) || other.isReacting == isReacting)&&(identical(other.reactionResultOption, reactionResultOption) || other.reactionResultOption == reactionResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_items),resultOption,isSubmitting,submitResultOption,isReacting,reactionResultOption);

@override
String toString() {
  return 'CommentsState(isLoading: $isLoading, items: $items, resultOption: $resultOption, isSubmitting: $isSubmitting, submitResultOption: $submitResultOption, isReacting: $isReacting, reactionResultOption: $reactionResultOption)';
}


}

/// @nodoc
abstract mixin class _$CommentsStateCopyWith<$Res> implements $CommentsStateCopyWith<$Res> {
  factory _$CommentsStateCopyWith(_CommentsState value, $Res Function(_CommentsState) _then) = __$CommentsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<CommentItem> items, Option<Either<GlobalFailure, List<CommentItem>>> resultOption, bool isSubmitting, Option<Either<GlobalFailure, CommentItem>> submitResultOption, bool isReacting, Option<Either<GlobalFailure, Unit>> reactionResultOption
});




}
/// @nodoc
class __$CommentsStateCopyWithImpl<$Res>
    implements _$CommentsStateCopyWith<$Res> {
  __$CommentsStateCopyWithImpl(this._self, this._then);

  final _CommentsState _self;
  final $Res Function(_CommentsState) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? items = null,Object? resultOption = null,Object? isSubmitting = null,Object? submitResultOption = null,Object? isReacting = null,Object? reactionResultOption = null,}) {
  return _then(_CommentsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CommentItem>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<CommentItem>>>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitResultOption: null == submitResultOption ? _self.submitResultOption : submitResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, CommentItem>>,isReacting: null == isReacting ? _self.isReacting : isReacting // ignore: cast_nullable_to_non_nullable
as bool,reactionResultOption: null == reactionResultOption ? _self.reactionResultOption : reactionResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}


}

// dart format on
