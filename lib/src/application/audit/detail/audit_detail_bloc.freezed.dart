// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuditDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditDetailEvent()';
}


}

/// @nodoc
class $AuditDetailEventCopyWith<$Res>  {
$AuditDetailEventCopyWith(AuditDetailEvent _, $Res Function(AuditDetailEvent) __);
}


/// Adds pattern-matching-related methods to [AuditDetailEvent].
extension AuditDetailEventPatterns on AuditDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _ChangeStatus value)?  changeStatus,TResult Function( _DocumentsRequested value)?  documentsRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _ChangeStatus value)  changeStatus,required TResult Function( _DocumentsRequested value)  documentsRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _ChangeStatus():
return changeStatus(_that);case _DocumentsRequested():
return documentsRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _ChangeStatus value)?  changeStatus,TResult? Function( _DocumentsRequested value)?  documentsRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchRequested,TResult Function()?  reset,TResult Function( int id,  String status)?  changeStatus,TResult Function( int id)?  documentsRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.id,_that.status);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchRequested,required TResult Function()  reset,required TResult Function( int id,  String status)  changeStatus,required TResult Function( int id)  documentsRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.id);case _Reset():
return reset();case _ChangeStatus():
return changeStatus(_that.id,_that.status);case _DocumentsRequested():
return documentsRequested(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchRequested,TResult? Function()?  reset,TResult? Function( int id,  String status)?  changeStatus,TResult? Function( int id)?  documentsRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.id,_that.status);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements AuditDetailEvent {
  const _FetchRequested({required this.id});
  

 final  int id;

/// Create a copy of AuditDetailEvent
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
  return 'AuditDetailEvent.fetchRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
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

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements AuditDetailEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuditDetailEvent.reset()';
}


}




/// @nodoc


class _ChangeStatus implements AuditDetailEvent {
  const _ChangeStatus({required this.id, required this.status});
  

 final  int id;
 final  String status;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStatusCopyWith<_ChangeStatus> get copyWith => __$ChangeStatusCopyWithImpl<_ChangeStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'AuditDetailEvent.changeStatus(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ChangeStatusCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$ChangeStatusCopyWith(_ChangeStatus value, $Res Function(_ChangeStatus) _then) = __$ChangeStatusCopyWithImpl;
@useResult
$Res call({
 int id, String status
});




}
/// @nodoc
class __$ChangeStatusCopyWithImpl<$Res>
    implements _$ChangeStatusCopyWith<$Res> {
  __$ChangeStatusCopyWithImpl(this._self, this._then);

  final _ChangeStatus _self;
  final $Res Function(_ChangeStatus) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(_ChangeStatus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DocumentsRequested implements AuditDetailEvent {
  const _DocumentsRequested({required this.id});
  

 final  int id;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentsRequestedCopyWith<_DocumentsRequested> get copyWith => __$DocumentsRequestedCopyWithImpl<_DocumentsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentsRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AuditDetailEvent.documentsRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DocumentsRequestedCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$DocumentsRequestedCopyWith(_DocumentsRequested value, $Res Function(_DocumentsRequested) _then) = __$DocumentsRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DocumentsRequestedCopyWithImpl<$Res>
    implements _$DocumentsRequestedCopyWith<$Res> {
  __$DocumentsRequestedCopyWithImpl(this._self, this._then);

  final _DocumentsRequested _self;
  final $Res Function(_DocumentsRequested) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DocumentsRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AuditDetailState {

 bool get isLoading; AuditItem? get item; Option<Either<GlobalFailure, AuditItem>> get resultOption; bool get isLoadingDocuments; List<AuditDocumentRequest> get documentRequests; Option<Either<GlobalFailure, List<AuditDocumentRequest>>> get documentsResultOption;
/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditDetailStateCopyWith<AuditDetailState> get copyWith => _$AuditDetailStateCopyWithImpl<AuditDetailState>(this as AuditDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingDocuments, isLoadingDocuments) || other.isLoadingDocuments == isLoadingDocuments)&&const DeepCollectionEquality().equals(other.documentRequests, documentRequests)&&(identical(other.documentsResultOption, documentsResultOption) || other.documentsResultOption == documentsResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingDocuments,const DeepCollectionEquality().hash(documentRequests),documentsResultOption);

@override
String toString() {
  return 'AuditDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingDocuments: $isLoadingDocuments, documentRequests: $documentRequests, documentsResultOption: $documentsResultOption)';
}


}

/// @nodoc
abstract mixin class $AuditDetailStateCopyWith<$Res>  {
  factory $AuditDetailStateCopyWith(AuditDetailState value, $Res Function(AuditDetailState) _then) = _$AuditDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, AuditItem? item, Option<Either<GlobalFailure, AuditItem>> resultOption, bool isLoadingDocuments, List<AuditDocumentRequest> documentRequests, Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption
});




}
/// @nodoc
class _$AuditDetailStateCopyWithImpl<$Res>
    implements $AuditDetailStateCopyWith<$Res> {
  _$AuditDetailStateCopyWithImpl(this._self, this._then);

  final AuditDetailState _self;
  final $Res Function(AuditDetailState) _then;

/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingDocuments = null,Object? documentRequests = null,Object? documentsResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AuditItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditItem>>,isLoadingDocuments: null == isLoadingDocuments ? _self.isLoadingDocuments : isLoadingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentRequests: null == documentRequests ? _self.documentRequests : documentRequests // ignore: cast_nullable_to_non_nullable
as List<AuditDocumentRequest>,documentsResultOption: null == documentsResultOption ? _self.documentsResultOption : documentsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditDocumentRequest>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditDetailState].
extension AuditDetailStatePatterns on AuditDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditDetailState value)  $default,){
final _that = this;
switch (_that) {
case _AuditDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption)  $default,) {final _that = this;
switch (_that) {
case _AuditDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption)?  $default,) {final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _AuditDetailState implements AuditDetailState {
  const _AuditDetailState({required this.isLoading, required this.item, required this.resultOption, this.isLoadingDocuments = false, final  List<AuditDocumentRequest> documentRequests = const [], required this.documentsResultOption}): _documentRequests = documentRequests;
  

@override final  bool isLoading;
@override final  AuditItem? item;
@override final  Option<Either<GlobalFailure, AuditItem>> resultOption;
@override@JsonKey() final  bool isLoadingDocuments;
 final  List<AuditDocumentRequest> _documentRequests;
@override@JsonKey() List<AuditDocumentRequest> get documentRequests {
  if (_documentRequests is EqualUnmodifiableListView) return _documentRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documentRequests);
}

@override final  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption;

/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditDetailStateCopyWith<_AuditDetailState> get copyWith => __$AuditDetailStateCopyWithImpl<_AuditDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingDocuments, isLoadingDocuments) || other.isLoadingDocuments == isLoadingDocuments)&&const DeepCollectionEquality().equals(other._documentRequests, _documentRequests)&&(identical(other.documentsResultOption, documentsResultOption) || other.documentsResultOption == documentsResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingDocuments,const DeepCollectionEquality().hash(_documentRequests),documentsResultOption);

@override
String toString() {
  return 'AuditDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingDocuments: $isLoadingDocuments, documentRequests: $documentRequests, documentsResultOption: $documentsResultOption)';
}


}

/// @nodoc
abstract mixin class _$AuditDetailStateCopyWith<$Res> implements $AuditDetailStateCopyWith<$Res> {
  factory _$AuditDetailStateCopyWith(_AuditDetailState value, $Res Function(_AuditDetailState) _then) = __$AuditDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, AuditItem? item, Option<Either<GlobalFailure, AuditItem>> resultOption, bool isLoadingDocuments, List<AuditDocumentRequest> documentRequests, Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption
});




}
/// @nodoc
class __$AuditDetailStateCopyWithImpl<$Res>
    implements _$AuditDetailStateCopyWith<$Res> {
  __$AuditDetailStateCopyWithImpl(this._self, this._then);

  final _AuditDetailState _self;
  final $Res Function(_AuditDetailState) _then;

/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingDocuments = null,Object? documentRequests = null,Object? documentsResultOption = null,}) {
  return _then(_AuditDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AuditItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditItem>>,isLoadingDocuments: null == isLoadingDocuments ? _self.isLoadingDocuments : isLoadingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentRequests: null == documentRequests ? _self._documentRequests : documentRequests // ignore: cast_nullable_to_non_nullable
as List<AuditDocumentRequest>,documentsResultOption: null == documentsResultOption ? _self.documentsResultOption : documentsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditDocumentRequest>>>,
  ));
}


}

// dart format on
