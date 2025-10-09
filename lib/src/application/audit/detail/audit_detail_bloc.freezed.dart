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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _ChangeStatus value)?  changeStatus,TResult Function( _DocumentsRequested value)?  documentsRequested,TResult Function( _ObservationsRequested value)?  observationsRequested,TResult Function( _ObservationsNextPageRequested value)?  observationsNextPageRequested,TResult Function( _ConclusionRequested value)?  conclusionRequested,TResult Function( _FetchResults value)?  fetchResults,TResult Function( _AddObservation value)?  addObservation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that);case _ObservationsRequested() when observationsRequested != null:
return observationsRequested(_that);case _ObservationsNextPageRequested() when observationsNextPageRequested != null:
return observationsNextPageRequested(_that);case _ConclusionRequested() when conclusionRequested != null:
return conclusionRequested(_that);case _FetchResults() when fetchResults != null:
return fetchResults(_that);case _AddObservation() when addObservation != null:
return addObservation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _ChangeStatus value)  changeStatus,required TResult Function( _DocumentsRequested value)  documentsRequested,required TResult Function( _ObservationsRequested value)  observationsRequested,required TResult Function( _ObservationsNextPageRequested value)  observationsNextPageRequested,required TResult Function( _ConclusionRequested value)  conclusionRequested,required TResult Function( _FetchResults value)  fetchResults,required TResult Function( _AddObservation value)  addObservation,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _ChangeStatus():
return changeStatus(_that);case _DocumentsRequested():
return documentsRequested(_that);case _ObservationsRequested():
return observationsRequested(_that);case _ObservationsNextPageRequested():
return observationsNextPageRequested(_that);case _ConclusionRequested():
return conclusionRequested(_that);case _FetchResults():
return fetchResults(_that);case _AddObservation():
return addObservation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _ChangeStatus value)?  changeStatus,TResult? Function( _DocumentsRequested value)?  documentsRequested,TResult? Function( _ObservationsRequested value)?  observationsRequested,TResult? Function( _ObservationsNextPageRequested value)?  observationsNextPageRequested,TResult? Function( _ConclusionRequested value)?  conclusionRequested,TResult? Function( _FetchResults value)?  fetchResults,TResult? Function( _AddObservation value)?  addObservation,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that);case _ObservationsRequested() when observationsRequested != null:
return observationsRequested(_that);case _ObservationsNextPageRequested() when observationsNextPageRequested != null:
return observationsNextPageRequested(_that);case _ConclusionRequested() when conclusionRequested != null:
return conclusionRequested(_that);case _FetchResults() when fetchResults != null:
return fetchResults(_that);case _AddObservation() when addObservation != null:
return addObservation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchRequested,TResult Function()?  reset,TResult Function( int id,  String status)?  changeStatus,TResult Function( int id)?  documentsRequested,TResult Function( int id,  int? page,  int? perPage)?  observationsRequested,TResult Function( int id)?  observationsNextPageRequested,TResult Function( int id)?  conclusionRequested,TResult Function( int id)?  fetchResults,TResult Function( int id,  String description,  int? commentaireId,  List<String> documents)?  addObservation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.id,_that.status);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that.id);case _ObservationsRequested() when observationsRequested != null:
return observationsRequested(_that.id,_that.page,_that.perPage);case _ObservationsNextPageRequested() when observationsNextPageRequested != null:
return observationsNextPageRequested(_that.id);case _ConclusionRequested() when conclusionRequested != null:
return conclusionRequested(_that.id);case _FetchResults() when fetchResults != null:
return fetchResults(_that.id);case _AddObservation() when addObservation != null:
return addObservation(_that.id,_that.description,_that.commentaireId,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchRequested,required TResult Function()  reset,required TResult Function( int id,  String status)  changeStatus,required TResult Function( int id)  documentsRequested,required TResult Function( int id,  int? page,  int? perPage)  observationsRequested,required TResult Function( int id)  observationsNextPageRequested,required TResult Function( int id)  conclusionRequested,required TResult Function( int id)  fetchResults,required TResult Function( int id,  String description,  int? commentaireId,  List<String> documents)  addObservation,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.id);case _Reset():
return reset();case _ChangeStatus():
return changeStatus(_that.id,_that.status);case _DocumentsRequested():
return documentsRequested(_that.id);case _ObservationsRequested():
return observationsRequested(_that.id,_that.page,_that.perPage);case _ObservationsNextPageRequested():
return observationsNextPageRequested(_that.id);case _ConclusionRequested():
return conclusionRequested(_that.id);case _FetchResults():
return fetchResults(_that.id);case _AddObservation():
return addObservation(_that.id,_that.description,_that.commentaireId,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchRequested,TResult? Function()?  reset,TResult? Function( int id,  String status)?  changeStatus,TResult? Function( int id)?  documentsRequested,TResult? Function( int id,  int? page,  int? perPage)?  observationsRequested,TResult? Function( int id)?  observationsNextPageRequested,TResult? Function( int id)?  conclusionRequested,TResult? Function( int id)?  fetchResults,TResult? Function( int id,  String description,  int? commentaireId,  List<String> documents)?  addObservation,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.id,_that.status);case _DocumentsRequested() when documentsRequested != null:
return documentsRequested(_that.id);case _ObservationsRequested() when observationsRequested != null:
return observationsRequested(_that.id,_that.page,_that.perPage);case _ObservationsNextPageRequested() when observationsNextPageRequested != null:
return observationsNextPageRequested(_that.id);case _ConclusionRequested() when conclusionRequested != null:
return conclusionRequested(_that.id);case _FetchResults() when fetchResults != null:
return fetchResults(_that.id);case _AddObservation() when addObservation != null:
return addObservation(_that.id,_that.description,_that.commentaireId,_that.documents);case _:
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


class _ObservationsRequested implements AuditDetailEvent {
  const _ObservationsRequested({required this.id, this.page, this.perPage});
  

 final  int id;
 final  int? page;
 final  int? perPage;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObservationsRequestedCopyWith<_ObservationsRequested> get copyWith => __$ObservationsRequestedCopyWithImpl<_ObservationsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObservationsRequested&&(identical(other.id, id) || other.id == id)&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,id,page,perPage);

@override
String toString() {
  return 'AuditDetailEvent.observationsRequested(id: $id, page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$ObservationsRequestedCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$ObservationsRequestedCopyWith(_ObservationsRequested value, $Res Function(_ObservationsRequested) _then) = __$ObservationsRequestedCopyWithImpl;
@useResult
$Res call({
 int id, int? page, int? perPage
});




}
/// @nodoc
class __$ObservationsRequestedCopyWithImpl<$Res>
    implements _$ObservationsRequestedCopyWith<$Res> {
  __$ObservationsRequestedCopyWithImpl(this._self, this._then);

  final _ObservationsRequested _self;
  final $Res Function(_ObservationsRequested) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? page = freezed,Object? perPage = freezed,}) {
  return _then(_ObservationsRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _ObservationsNextPageRequested implements AuditDetailEvent {
  const _ObservationsNextPageRequested({required this.id});
  

 final  int id;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObservationsNextPageRequestedCopyWith<_ObservationsNextPageRequested> get copyWith => __$ObservationsNextPageRequestedCopyWithImpl<_ObservationsNextPageRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObservationsNextPageRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AuditDetailEvent.observationsNextPageRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ObservationsNextPageRequestedCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$ObservationsNextPageRequestedCopyWith(_ObservationsNextPageRequested value, $Res Function(_ObservationsNextPageRequested) _then) = __$ObservationsNextPageRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ObservationsNextPageRequestedCopyWithImpl<$Res>
    implements _$ObservationsNextPageRequestedCopyWith<$Res> {
  __$ObservationsNextPageRequestedCopyWithImpl(this._self, this._then);

  final _ObservationsNextPageRequested _self;
  final $Res Function(_ObservationsNextPageRequested) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ObservationsNextPageRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ConclusionRequested implements AuditDetailEvent {
  const _ConclusionRequested({required this.id});
  

 final  int id;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConclusionRequestedCopyWith<_ConclusionRequested> get copyWith => __$ConclusionRequestedCopyWithImpl<_ConclusionRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConclusionRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AuditDetailEvent.conclusionRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ConclusionRequestedCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$ConclusionRequestedCopyWith(_ConclusionRequested value, $Res Function(_ConclusionRequested) _then) = __$ConclusionRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ConclusionRequestedCopyWithImpl<$Res>
    implements _$ConclusionRequestedCopyWith<$Res> {
  __$ConclusionRequestedCopyWithImpl(this._self, this._then);

  final _ConclusionRequested _self;
  final $Res Function(_ConclusionRequested) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ConclusionRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FetchResults implements AuditDetailEvent {
  const _FetchResults({required this.id});
  

 final  int id;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchResultsCopyWith<_FetchResults> get copyWith => __$FetchResultsCopyWithImpl<_FetchResults>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchResults&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AuditDetailEvent.fetchResults(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchResultsCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$FetchResultsCopyWith(_FetchResults value, $Res Function(_FetchResults) _then) = __$FetchResultsCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchResultsCopyWithImpl<$Res>
    implements _$FetchResultsCopyWith<$Res> {
  __$FetchResultsCopyWithImpl(this._self, this._then);

  final _FetchResults _self;
  final $Res Function(_FetchResults) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchResults(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddObservation implements AuditDetailEvent {
  const _AddObservation({required this.id, required this.description, this.commentaireId, required final  List<String> documents}): _documents = documents;
  

 final  int id;
 final  String description;
 final  int? commentaireId;
 final  List<String> _documents;
 List<String> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddObservationCopyWith<_AddObservation> get copyWith => __$AddObservationCopyWithImpl<_AddObservation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddObservation&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.commentaireId, commentaireId) || other.commentaireId == commentaireId)&&const DeepCollectionEquality().equals(other._documents, _documents));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,commentaireId,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'AuditDetailEvent.addObservation(id: $id, description: $description, commentaireId: $commentaireId, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$AddObservationCopyWith<$Res> implements $AuditDetailEventCopyWith<$Res> {
  factory _$AddObservationCopyWith(_AddObservation value, $Res Function(_AddObservation) _then) = __$AddObservationCopyWithImpl;
@useResult
$Res call({
 int id, String description, int? commentaireId, List<String> documents
});




}
/// @nodoc
class __$AddObservationCopyWithImpl<$Res>
    implements _$AddObservationCopyWith<$Res> {
  __$AddObservationCopyWithImpl(this._self, this._then);

  final _AddObservation _self;
  final $Res Function(_AddObservation) _then;

/// Create a copy of AuditDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? commentaireId = freezed,Object? documents = null,}) {
  return _then(_AddObservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,commentaireId: freezed == commentaireId ? _self.commentaireId : commentaireId // ignore: cast_nullable_to_non_nullable
as int?,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$AuditDetailState {

 bool get isLoading; AuditItem? get item; Option<Either<GlobalFailure, AuditItem>> get resultOption; bool get isLoadingDocuments; List<AuditDocumentRequest> get documentRequests; Option<Either<GlobalFailure, List<AuditDocumentRequest>>> get documentsResultOption;// Observations
 bool get isLoadingObservations; List<AuditObservation> get observations; Pagination? get observationsPagination; Option<Either<GlobalFailure, Paginated<AuditObservation>>> get observationsResultOption;// Conclusion
 bool get isLoadingConclusion; AuditConclusion? get conclusion; Option<Either<GlobalFailure, AuditConclusion>> get conclusionResultOption;// Results
 bool get isLoadingResults; List<AuditResult> get results; Option<Either<GlobalFailure, List<AuditResult>>> get resultsResultOption;// Add observation
 bool get isAddingObservation; Option<Either<GlobalFailure, AuditObservation>> get addObservationResultOption;
/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditDetailStateCopyWith<AuditDetailState> get copyWith => _$AuditDetailStateCopyWithImpl<AuditDetailState>(this as AuditDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingDocuments, isLoadingDocuments) || other.isLoadingDocuments == isLoadingDocuments)&&const DeepCollectionEquality().equals(other.documentRequests, documentRequests)&&(identical(other.documentsResultOption, documentsResultOption) || other.documentsResultOption == documentsResultOption)&&(identical(other.isLoadingObservations, isLoadingObservations) || other.isLoadingObservations == isLoadingObservations)&&const DeepCollectionEquality().equals(other.observations, observations)&&(identical(other.observationsPagination, observationsPagination) || other.observationsPagination == observationsPagination)&&(identical(other.observationsResultOption, observationsResultOption) || other.observationsResultOption == observationsResultOption)&&(identical(other.isLoadingConclusion, isLoadingConclusion) || other.isLoadingConclusion == isLoadingConclusion)&&(identical(other.conclusion, conclusion) || other.conclusion == conclusion)&&(identical(other.conclusionResultOption, conclusionResultOption) || other.conclusionResultOption == conclusionResultOption)&&(identical(other.isLoadingResults, isLoadingResults) || other.isLoadingResults == isLoadingResults)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.resultsResultOption, resultsResultOption) || other.resultsResultOption == resultsResultOption)&&(identical(other.isAddingObservation, isAddingObservation) || other.isAddingObservation == isAddingObservation)&&(identical(other.addObservationResultOption, addObservationResultOption) || other.addObservationResultOption == addObservationResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingDocuments,const DeepCollectionEquality().hash(documentRequests),documentsResultOption,isLoadingObservations,const DeepCollectionEquality().hash(observations),observationsPagination,observationsResultOption,isLoadingConclusion,conclusion,conclusionResultOption,isLoadingResults,const DeepCollectionEquality().hash(results),resultsResultOption,isAddingObservation,addObservationResultOption);

@override
String toString() {
  return 'AuditDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingDocuments: $isLoadingDocuments, documentRequests: $documentRequests, documentsResultOption: $documentsResultOption, isLoadingObservations: $isLoadingObservations, observations: $observations, observationsPagination: $observationsPagination, observationsResultOption: $observationsResultOption, isLoadingConclusion: $isLoadingConclusion, conclusion: $conclusion, conclusionResultOption: $conclusionResultOption, isLoadingResults: $isLoadingResults, results: $results, resultsResultOption: $resultsResultOption, isAddingObservation: $isAddingObservation, addObservationResultOption: $addObservationResultOption)';
}


}

/// @nodoc
abstract mixin class $AuditDetailStateCopyWith<$Res>  {
  factory $AuditDetailStateCopyWith(AuditDetailState value, $Res Function(AuditDetailState) _then) = _$AuditDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, AuditItem? item, Option<Either<GlobalFailure, AuditItem>> resultOption, bool isLoadingDocuments, List<AuditDocumentRequest> documentRequests, Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption, bool isLoadingObservations, List<AuditObservation> observations, Pagination? observationsPagination, Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption, bool isLoadingConclusion, AuditConclusion? conclusion, Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption, bool isLoadingResults, List<AuditResult> results, Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption, bool isAddingObservation, Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingDocuments = null,Object? documentRequests = null,Object? documentsResultOption = null,Object? isLoadingObservations = null,Object? observations = null,Object? observationsPagination = freezed,Object? observationsResultOption = null,Object? isLoadingConclusion = null,Object? conclusion = freezed,Object? conclusionResultOption = null,Object? isLoadingResults = null,Object? results = null,Object? resultsResultOption = null,Object? isAddingObservation = null,Object? addObservationResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AuditItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditItem>>,isLoadingDocuments: null == isLoadingDocuments ? _self.isLoadingDocuments : isLoadingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentRequests: null == documentRequests ? _self.documentRequests : documentRequests // ignore: cast_nullable_to_non_nullable
as List<AuditDocumentRequest>,documentsResultOption: null == documentsResultOption ? _self.documentsResultOption : documentsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditDocumentRequest>>>,isLoadingObservations: null == isLoadingObservations ? _self.isLoadingObservations : isLoadingObservations // ignore: cast_nullable_to_non_nullable
as bool,observations: null == observations ? _self.observations : observations // ignore: cast_nullable_to_non_nullable
as List<AuditObservation>,observationsPagination: freezed == observationsPagination ? _self.observationsPagination : observationsPagination // ignore: cast_nullable_to_non_nullable
as Pagination?,observationsResultOption: null == observationsResultOption ? _self.observationsResultOption : observationsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<AuditObservation>>>,isLoadingConclusion: null == isLoadingConclusion ? _self.isLoadingConclusion : isLoadingConclusion // ignore: cast_nullable_to_non_nullable
as bool,conclusion: freezed == conclusion ? _self.conclusion : conclusion // ignore: cast_nullable_to_non_nullable
as AuditConclusion?,conclusionResultOption: null == conclusionResultOption ? _self.conclusionResultOption : conclusionResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditConclusion>>,isLoadingResults: null == isLoadingResults ? _self.isLoadingResults : isLoadingResults // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<AuditResult>,resultsResultOption: null == resultsResultOption ? _self.resultsResultOption : resultsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditResult>>>,isAddingObservation: null == isAddingObservation ? _self.isAddingObservation : isAddingObservation // ignore: cast_nullable_to_non_nullable
as bool,addObservationResultOption: null == addObservationResultOption ? _self.addObservationResultOption : addObservationResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditObservation>>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption,  bool isLoadingObservations,  List<AuditObservation> observations,  Pagination? observationsPagination,  Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption,  bool isLoadingConclusion,  AuditConclusion? conclusion,  Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption,  bool isLoadingResults,  List<AuditResult> results,  Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption,  bool isAddingObservation,  Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption,_that.isLoadingObservations,_that.observations,_that.observationsPagination,_that.observationsResultOption,_that.isLoadingConclusion,_that.conclusion,_that.conclusionResultOption,_that.isLoadingResults,_that.results,_that.resultsResultOption,_that.isAddingObservation,_that.addObservationResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption,  bool isLoadingObservations,  List<AuditObservation> observations,  Pagination? observationsPagination,  Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption,  bool isLoadingConclusion,  AuditConclusion? conclusion,  Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption,  bool isLoadingResults,  List<AuditResult> results,  Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption,  bool isAddingObservation,  Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption)  $default,) {final _that = this;
switch (_that) {
case _AuditDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption,_that.isLoadingObservations,_that.observations,_that.observationsPagination,_that.observationsResultOption,_that.isLoadingConclusion,_that.conclusion,_that.conclusionResultOption,_that.isLoadingResults,_that.results,_that.resultsResultOption,_that.isAddingObservation,_that.addObservationResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  AuditItem? item,  Option<Either<GlobalFailure, AuditItem>> resultOption,  bool isLoadingDocuments,  List<AuditDocumentRequest> documentRequests,  Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption,  bool isLoadingObservations,  List<AuditObservation> observations,  Pagination? observationsPagination,  Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption,  bool isLoadingConclusion,  AuditConclusion? conclusion,  Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption,  bool isLoadingResults,  List<AuditResult> results,  Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption,  bool isAddingObservation,  Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption)?  $default,) {final _that = this;
switch (_that) {
case _AuditDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingDocuments,_that.documentRequests,_that.documentsResultOption,_that.isLoadingObservations,_that.observations,_that.observationsPagination,_that.observationsResultOption,_that.isLoadingConclusion,_that.conclusion,_that.conclusionResultOption,_that.isLoadingResults,_that.results,_that.resultsResultOption,_that.isAddingObservation,_that.addObservationResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _AuditDetailState implements AuditDetailState {
  const _AuditDetailState({required this.isLoading, required this.item, required this.resultOption, this.isLoadingDocuments = false, final  List<AuditDocumentRequest> documentRequests = const [], required this.documentsResultOption, this.isLoadingObservations = false, final  List<AuditObservation> observations = const [], this.observationsPagination, required this.observationsResultOption, this.isLoadingConclusion = false, this.conclusion, required this.conclusionResultOption, this.isLoadingResults = false, final  List<AuditResult> results = const [], required this.resultsResultOption, this.isAddingObservation = false, required this.addObservationResultOption}): _documentRequests = documentRequests,_observations = observations,_results = results;
  

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
// Observations
@override@JsonKey() final  bool isLoadingObservations;
 final  List<AuditObservation> _observations;
@override@JsonKey() List<AuditObservation> get observations {
  if (_observations is EqualUnmodifiableListView) return _observations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_observations);
}

@override final  Pagination? observationsPagination;
@override final  Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption;
// Conclusion
@override@JsonKey() final  bool isLoadingConclusion;
@override final  AuditConclusion? conclusion;
@override final  Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption;
// Results
@override@JsonKey() final  bool isLoadingResults;
 final  List<AuditResult> _results;
@override@JsonKey() List<AuditResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption;
// Add observation
@override@JsonKey() final  bool isAddingObservation;
@override final  Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption;

/// Create a copy of AuditDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditDetailStateCopyWith<_AuditDetailState> get copyWith => __$AuditDetailStateCopyWithImpl<_AuditDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingDocuments, isLoadingDocuments) || other.isLoadingDocuments == isLoadingDocuments)&&const DeepCollectionEquality().equals(other._documentRequests, _documentRequests)&&(identical(other.documentsResultOption, documentsResultOption) || other.documentsResultOption == documentsResultOption)&&(identical(other.isLoadingObservations, isLoadingObservations) || other.isLoadingObservations == isLoadingObservations)&&const DeepCollectionEquality().equals(other._observations, _observations)&&(identical(other.observationsPagination, observationsPagination) || other.observationsPagination == observationsPagination)&&(identical(other.observationsResultOption, observationsResultOption) || other.observationsResultOption == observationsResultOption)&&(identical(other.isLoadingConclusion, isLoadingConclusion) || other.isLoadingConclusion == isLoadingConclusion)&&(identical(other.conclusion, conclusion) || other.conclusion == conclusion)&&(identical(other.conclusionResultOption, conclusionResultOption) || other.conclusionResultOption == conclusionResultOption)&&(identical(other.isLoadingResults, isLoadingResults) || other.isLoadingResults == isLoadingResults)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.resultsResultOption, resultsResultOption) || other.resultsResultOption == resultsResultOption)&&(identical(other.isAddingObservation, isAddingObservation) || other.isAddingObservation == isAddingObservation)&&(identical(other.addObservationResultOption, addObservationResultOption) || other.addObservationResultOption == addObservationResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingDocuments,const DeepCollectionEquality().hash(_documentRequests),documentsResultOption,isLoadingObservations,const DeepCollectionEquality().hash(_observations),observationsPagination,observationsResultOption,isLoadingConclusion,conclusion,conclusionResultOption,isLoadingResults,const DeepCollectionEquality().hash(_results),resultsResultOption,isAddingObservation,addObservationResultOption);

@override
String toString() {
  return 'AuditDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingDocuments: $isLoadingDocuments, documentRequests: $documentRequests, documentsResultOption: $documentsResultOption, isLoadingObservations: $isLoadingObservations, observations: $observations, observationsPagination: $observationsPagination, observationsResultOption: $observationsResultOption, isLoadingConclusion: $isLoadingConclusion, conclusion: $conclusion, conclusionResultOption: $conclusionResultOption, isLoadingResults: $isLoadingResults, results: $results, resultsResultOption: $resultsResultOption, isAddingObservation: $isAddingObservation, addObservationResultOption: $addObservationResultOption)';
}


}

/// @nodoc
abstract mixin class _$AuditDetailStateCopyWith<$Res> implements $AuditDetailStateCopyWith<$Res> {
  factory _$AuditDetailStateCopyWith(_AuditDetailState value, $Res Function(_AuditDetailState) _then) = __$AuditDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, AuditItem? item, Option<Either<GlobalFailure, AuditItem>> resultOption, bool isLoadingDocuments, List<AuditDocumentRequest> documentRequests, Option<Either<GlobalFailure, List<AuditDocumentRequest>>> documentsResultOption, bool isLoadingObservations, List<AuditObservation> observations, Pagination? observationsPagination, Option<Either<GlobalFailure, Paginated<AuditObservation>>> observationsResultOption, bool isLoadingConclusion, AuditConclusion? conclusion, Option<Either<GlobalFailure, AuditConclusion>> conclusionResultOption, bool isLoadingResults, List<AuditResult> results, Option<Either<GlobalFailure, List<AuditResult>>> resultsResultOption, bool isAddingObservation, Option<Either<GlobalFailure, AuditObservation>> addObservationResultOption
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingDocuments = null,Object? documentRequests = null,Object? documentsResultOption = null,Object? isLoadingObservations = null,Object? observations = null,Object? observationsPagination = freezed,Object? observationsResultOption = null,Object? isLoadingConclusion = null,Object? conclusion = freezed,Object? conclusionResultOption = null,Object? isLoadingResults = null,Object? results = null,Object? resultsResultOption = null,Object? isAddingObservation = null,Object? addObservationResultOption = null,}) {
  return _then(_AuditDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AuditItem?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditItem>>,isLoadingDocuments: null == isLoadingDocuments ? _self.isLoadingDocuments : isLoadingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentRequests: null == documentRequests ? _self._documentRequests : documentRequests // ignore: cast_nullable_to_non_nullable
as List<AuditDocumentRequest>,documentsResultOption: null == documentsResultOption ? _self.documentsResultOption : documentsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditDocumentRequest>>>,isLoadingObservations: null == isLoadingObservations ? _self.isLoadingObservations : isLoadingObservations // ignore: cast_nullable_to_non_nullable
as bool,observations: null == observations ? _self._observations : observations // ignore: cast_nullable_to_non_nullable
as List<AuditObservation>,observationsPagination: freezed == observationsPagination ? _self.observationsPagination : observationsPagination // ignore: cast_nullable_to_non_nullable
as Pagination?,observationsResultOption: null == observationsResultOption ? _self.observationsResultOption : observationsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Paginated<AuditObservation>>>,isLoadingConclusion: null == isLoadingConclusion ? _self.isLoadingConclusion : isLoadingConclusion // ignore: cast_nullable_to_non_nullable
as bool,conclusion: freezed == conclusion ? _self.conclusion : conclusion // ignore: cast_nullable_to_non_nullable
as AuditConclusion?,conclusionResultOption: null == conclusionResultOption ? _self.conclusionResultOption : conclusionResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditConclusion>>,isLoadingResults: null == isLoadingResults ? _self.isLoadingResults : isLoadingResults // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<AuditResult>,resultsResultOption: null == resultsResultOption ? _self.resultsResultOption : resultsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<AuditResult>>>,isAddingObservation: null == isAddingObservation ? _self.isAddingObservation : isAddingObservation // ignore: cast_nullable_to_non_nullable
as bool,addObservationResultOption: null == addObservationResultOption ? _self.addObservationResultOption : addObservationResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, AuditObservation>>,
  ));
}


}

// dart format on
