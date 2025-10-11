// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formation_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormationDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationDetailEvent()';
}


}

/// @nodoc
class $FormationDetailEventCopyWith<$Res>  {
$FormationDetailEventCopyWith(FormationDetailEvent _, $Res Function(FormationDetailEvent) __);
}


/// Adds pattern-matching-related methods to [FormationDetailEvent].
extension FormationDetailEventPatterns on FormationDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _ParticipantsRequested value)?  participantsRequested,TResult Function( _CoursesRequested value)?  coursesRequested,TResult Function( _StartCourseRequested value)?  startCourseRequested,TResult Function( _FinishCourseRequested value)?  finishCourseRequested,TResult Function( _FinishFormationRequested value)?  finishFormationRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that);case _CoursesRequested() when coursesRequested != null:
return coursesRequested(_that);case _StartCourseRequested() when startCourseRequested != null:
return startCourseRequested(_that);case _FinishCourseRequested() when finishCourseRequested != null:
return finishCourseRequested(_that);case _FinishFormationRequested() when finishFormationRequested != null:
return finishFormationRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _ParticipantsRequested value)  participantsRequested,required TResult Function( _CoursesRequested value)  coursesRequested,required TResult Function( _StartCourseRequested value)  startCourseRequested,required TResult Function( _FinishCourseRequested value)  finishCourseRequested,required TResult Function( _FinishFormationRequested value)  finishFormationRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _ParticipantsRequested():
return participantsRequested(_that);case _CoursesRequested():
return coursesRequested(_that);case _StartCourseRequested():
return startCourseRequested(_that);case _FinishCourseRequested():
return finishCourseRequested(_that);case _FinishFormationRequested():
return finishFormationRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _ParticipantsRequested value)?  participantsRequested,TResult? Function( _CoursesRequested value)?  coursesRequested,TResult? Function( _StartCourseRequested value)?  startCourseRequested,TResult? Function( _FinishCourseRequested value)?  finishCourseRequested,TResult? Function( _FinishFormationRequested value)?  finishFormationRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that);case _CoursesRequested() when coursesRequested != null:
return coursesRequested(_that);case _StartCourseRequested() when startCourseRequested != null:
return startCourseRequested(_that);case _FinishCourseRequested() when finishCourseRequested != null:
return finishCourseRequested(_that);case _FinishFormationRequested() when finishFormationRequested != null:
return finishFormationRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchRequested,TResult Function()?  reset,TResult Function( int id)?  participantsRequested,TResult Function( int id)?  coursesRequested,TResult Function( int id)?  startCourseRequested,TResult Function( int id)?  finishCourseRequested,TResult Function( int id)?  finishFormationRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that.id);case _CoursesRequested() when coursesRequested != null:
return coursesRequested(_that.id);case _StartCourseRequested() when startCourseRequested != null:
return startCourseRequested(_that.id);case _FinishCourseRequested() when finishCourseRequested != null:
return finishCourseRequested(_that.id);case _FinishFormationRequested() when finishFormationRequested != null:
return finishFormationRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchRequested,required TResult Function()  reset,required TResult Function( int id)  participantsRequested,required TResult Function( int id)  coursesRequested,required TResult Function( int id)  startCourseRequested,required TResult Function( int id)  finishCourseRequested,required TResult Function( int id)  finishFormationRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.id);case _Reset():
return reset();case _ParticipantsRequested():
return participantsRequested(_that.id);case _CoursesRequested():
return coursesRequested(_that.id);case _StartCourseRequested():
return startCourseRequested(_that.id);case _FinishCourseRequested():
return finishCourseRequested(_that.id);case _FinishFormationRequested():
return finishFormationRequested(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchRequested,TResult? Function()?  reset,TResult? Function( int id)?  participantsRequested,TResult? Function( int id)?  coursesRequested,TResult? Function( int id)?  startCourseRequested,TResult? Function( int id)?  finishCourseRequested,TResult? Function( int id)?  finishFormationRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that.id);case _CoursesRequested() when coursesRequested != null:
return coursesRequested(_that.id);case _StartCourseRequested() when startCourseRequested != null:
return startCourseRequested(_that.id);case _FinishCourseRequested() when finishCourseRequested != null:
return finishCourseRequested(_that.id);case _FinishFormationRequested() when finishFormationRequested != null:
return finishFormationRequested(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchRequested implements FormationDetailEvent {
  const _FetchRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
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
  return 'FormationDetailEvent.fetchRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
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

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements FormationDetailEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormationDetailEvent.reset()';
}


}




/// @nodoc


class _ParticipantsRequested implements FormationDetailEvent {
  const _ParticipantsRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantsRequestedCopyWith<_ParticipantsRequested> get copyWith => __$ParticipantsRequestedCopyWithImpl<_ParticipantsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantsRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FormationDetailEvent.participantsRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ParticipantsRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
  factory _$ParticipantsRequestedCopyWith(_ParticipantsRequested value, $Res Function(_ParticipantsRequested) _then) = __$ParticipantsRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ParticipantsRequestedCopyWithImpl<$Res>
    implements _$ParticipantsRequestedCopyWith<$Res> {
  __$ParticipantsRequestedCopyWithImpl(this._self, this._then);

  final _ParticipantsRequested _self;
  final $Res Function(_ParticipantsRequested) _then;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ParticipantsRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CoursesRequested implements FormationDetailEvent {
  const _CoursesRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoursesRequestedCopyWith<_CoursesRequested> get copyWith => __$CoursesRequestedCopyWithImpl<_CoursesRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoursesRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FormationDetailEvent.coursesRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$CoursesRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
  factory _$CoursesRequestedCopyWith(_CoursesRequested value, $Res Function(_CoursesRequested) _then) = __$CoursesRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$CoursesRequestedCopyWithImpl<$Res>
    implements _$CoursesRequestedCopyWith<$Res> {
  __$CoursesRequestedCopyWithImpl(this._self, this._then);

  final _CoursesRequested _self;
  final $Res Function(_CoursesRequested) _then;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_CoursesRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StartCourseRequested implements FormationDetailEvent {
  const _StartCourseRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartCourseRequestedCopyWith<_StartCourseRequested> get copyWith => __$StartCourseRequestedCopyWithImpl<_StartCourseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartCourseRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FormationDetailEvent.startCourseRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$StartCourseRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
  factory _$StartCourseRequestedCopyWith(_StartCourseRequested value, $Res Function(_StartCourseRequested) _then) = __$StartCourseRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$StartCourseRequestedCopyWithImpl<$Res>
    implements _$StartCourseRequestedCopyWith<$Res> {
  __$StartCourseRequestedCopyWithImpl(this._self, this._then);

  final _StartCourseRequested _self;
  final $Res Function(_StartCourseRequested) _then;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_StartCourseRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FinishCourseRequested implements FormationDetailEvent {
  const _FinishCourseRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishCourseRequestedCopyWith<_FinishCourseRequested> get copyWith => __$FinishCourseRequestedCopyWithImpl<_FinishCourseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishCourseRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FormationDetailEvent.finishCourseRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FinishCourseRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
  factory _$FinishCourseRequestedCopyWith(_FinishCourseRequested value, $Res Function(_FinishCourseRequested) _then) = __$FinishCourseRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FinishCourseRequestedCopyWithImpl<$Res>
    implements _$FinishCourseRequestedCopyWith<$Res> {
  __$FinishCourseRequestedCopyWithImpl(this._self, this._then);

  final _FinishCourseRequested _self;
  final $Res Function(_FinishCourseRequested) _then;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FinishCourseRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FinishFormationRequested implements FormationDetailEvent {
  const _FinishFormationRequested({required this.id});
  

 final  int id;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishFormationRequestedCopyWith<_FinishFormationRequested> get copyWith => __$FinishFormationRequestedCopyWithImpl<_FinishFormationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishFormationRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FormationDetailEvent.finishFormationRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FinishFormationRequestedCopyWith<$Res> implements $FormationDetailEventCopyWith<$Res> {
  factory _$FinishFormationRequestedCopyWith(_FinishFormationRequested value, $Res Function(_FinishFormationRequested) _then) = __$FinishFormationRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FinishFormationRequestedCopyWithImpl<$Res>
    implements _$FinishFormationRequestedCopyWith<$Res> {
  __$FinishFormationRequestedCopyWithImpl(this._self, this._then);

  final _FinishFormationRequested _self;
  final $Res Function(_FinishFormationRequested) _then;

/// Create a copy of FormationDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FinishFormationRequested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FormationDetailState {

 bool get isLoading; FormationDetail? get item; Option<Either<GlobalFailure, FormationDetail>> get resultOption; bool get isLoadingParticipants; List<FormationParticipantRegistration> get participants; Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> get participantsResultOption; bool get isLoadingCourses; List<FormationCourse> get courses; Option<Either<GlobalFailure, List<FormationCourse>>> get coursesResultOption; bool get isStartingCourse; Option<Either<GlobalFailure, StartCourseResult>> get startCourseResultOption; bool get isFinishingCourse; Option<Either<GlobalFailure, FinishCourseResult>> get finishCourseResultOption; bool? get isFinishingFormation; Option<Either<GlobalFailure, FinishFormationResult>> get finishFormationResultOption;
/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormationDetailStateCopyWith<FormationDetailState> get copyWith => _$FormationDetailStateCopyWithImpl<FormationDetailState>(this as FormationDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingParticipants, isLoadingParticipants) || other.isLoadingParticipants == isLoadingParticipants)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsResultOption, participantsResultOption) || other.participantsResultOption == participantsResultOption)&&(identical(other.isLoadingCourses, isLoadingCourses) || other.isLoadingCourses == isLoadingCourses)&&const DeepCollectionEquality().equals(other.courses, courses)&&(identical(other.coursesResultOption, coursesResultOption) || other.coursesResultOption == coursesResultOption)&&(identical(other.isStartingCourse, isStartingCourse) || other.isStartingCourse == isStartingCourse)&&(identical(other.startCourseResultOption, startCourseResultOption) || other.startCourseResultOption == startCourseResultOption)&&(identical(other.isFinishingCourse, isFinishingCourse) || other.isFinishingCourse == isFinishingCourse)&&(identical(other.finishCourseResultOption, finishCourseResultOption) || other.finishCourseResultOption == finishCourseResultOption)&&(identical(other.isFinishingFormation, isFinishingFormation) || other.isFinishingFormation == isFinishingFormation)&&(identical(other.finishFormationResultOption, finishFormationResultOption) || other.finishFormationResultOption == finishFormationResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingParticipants,const DeepCollectionEquality().hash(participants),participantsResultOption,isLoadingCourses,const DeepCollectionEquality().hash(courses),coursesResultOption,isStartingCourse,startCourseResultOption,isFinishingCourse,finishCourseResultOption,isFinishingFormation,finishFormationResultOption);

@override
String toString() {
  return 'FormationDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingParticipants: $isLoadingParticipants, participants: $participants, participantsResultOption: $participantsResultOption, isLoadingCourses: $isLoadingCourses, courses: $courses, coursesResultOption: $coursesResultOption, isStartingCourse: $isStartingCourse, startCourseResultOption: $startCourseResultOption, isFinishingCourse: $isFinishingCourse, finishCourseResultOption: $finishCourseResultOption, isFinishingFormation: $isFinishingFormation, finishFormationResultOption: $finishFormationResultOption)';
}


}

/// @nodoc
abstract mixin class $FormationDetailStateCopyWith<$Res>  {
  factory $FormationDetailStateCopyWith(FormationDetailState value, $Res Function(FormationDetailState) _then) = _$FormationDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, FormationDetail? item, Option<Either<GlobalFailure, FormationDetail>> resultOption, bool isLoadingParticipants, List<FormationParticipantRegistration> participants, Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption, bool isLoadingCourses, List<FormationCourse> courses, Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption, bool isStartingCourse, Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption, bool isFinishingCourse, Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption, bool? isFinishingFormation, Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption
});




}
/// @nodoc
class _$FormationDetailStateCopyWithImpl<$Res>
    implements $FormationDetailStateCopyWith<$Res> {
  _$FormationDetailStateCopyWithImpl(this._self, this._then);

  final FormationDetailState _self;
  final $Res Function(FormationDetailState) _then;

/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingParticipants = null,Object? participants = null,Object? participantsResultOption = null,Object? isLoadingCourses = null,Object? courses = null,Object? coursesResultOption = null,Object? isStartingCourse = null,Object? startCourseResultOption = null,Object? isFinishingCourse = null,Object? finishCourseResultOption = null,Object? isFinishingFormation = freezed,Object? finishFormationResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FormationDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FormationDetail>>,isLoadingParticipants: null == isLoadingParticipants ? _self.isLoadingParticipants : isLoadingParticipants // ignore: cast_nullable_to_non_nullable
as bool,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<FormationParticipantRegistration>,participantsResultOption: null == participantsResultOption ? _self.participantsResultOption : participantsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationParticipantRegistration>>>,isLoadingCourses: null == isLoadingCourses ? _self.isLoadingCourses : isLoadingCourses // ignore: cast_nullable_to_non_nullable
as bool,courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<FormationCourse>,coursesResultOption: null == coursesResultOption ? _self.coursesResultOption : coursesResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationCourse>>>,isStartingCourse: null == isStartingCourse ? _self.isStartingCourse : isStartingCourse // ignore: cast_nullable_to_non_nullable
as bool,startCourseResultOption: null == startCourseResultOption ? _self.startCourseResultOption : startCourseResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, StartCourseResult>>,isFinishingCourse: null == isFinishingCourse ? _self.isFinishingCourse : isFinishingCourse // ignore: cast_nullable_to_non_nullable
as bool,finishCourseResultOption: null == finishCourseResultOption ? _self.finishCourseResultOption : finishCourseResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FinishCourseResult>>,isFinishingFormation: freezed == isFinishingFormation ? _self.isFinishingFormation : isFinishingFormation // ignore: cast_nullable_to_non_nullable
as bool?,finishFormationResultOption: null == finishFormationResultOption ? _self.finishFormationResultOption : finishFormationResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FinishFormationResult>>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormationDetailState].
extension FormationDetailStatePatterns on FormationDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormationDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormationDetailState value)  $default,){
final _that = this;
switch (_that) {
case _FormationDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormationDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption,  bool isLoadingCourses,  List<FormationCourse> courses,  Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption,  bool isStartingCourse,  Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption,  bool isFinishingCourse,  Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption,  bool? isFinishingFormation,  Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption,_that.isLoadingCourses,_that.courses,_that.coursesResultOption,_that.isStartingCourse,_that.startCourseResultOption,_that.isFinishingCourse,_that.finishCourseResultOption,_that.isFinishingFormation,_that.finishFormationResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption,  bool isLoadingCourses,  List<FormationCourse> courses,  Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption,  bool isStartingCourse,  Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption,  bool isFinishingCourse,  Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption,  bool? isFinishingFormation,  Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption)  $default,) {final _that = this;
switch (_that) {
case _FormationDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption,_that.isLoadingCourses,_that.courses,_that.coursesResultOption,_that.isStartingCourse,_that.startCourseResultOption,_that.isFinishingCourse,_that.finishCourseResultOption,_that.isFinishingFormation,_that.finishFormationResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption,  bool isLoadingCourses,  List<FormationCourse> courses,  Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption,  bool isStartingCourse,  Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption,  bool isFinishingCourse,  Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption,  bool? isFinishingFormation,  Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption)?  $default,) {final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption,_that.isLoadingCourses,_that.courses,_that.coursesResultOption,_that.isStartingCourse,_that.startCourseResultOption,_that.isFinishingCourse,_that.finishCourseResultOption,_that.isFinishingFormation,_that.finishFormationResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _FormationDetailState implements FormationDetailState {
  const _FormationDetailState({this.isLoading = false, this.item, required this.resultOption, this.isLoadingParticipants = false, final  List<FormationParticipantRegistration> participants = const [], required this.participantsResultOption, this.isLoadingCourses = false, final  List<FormationCourse> courses = const [], required this.coursesResultOption, this.isStartingCourse = false, required this.startCourseResultOption, this.isFinishingCourse = false, required this.finishCourseResultOption, this.isFinishingFormation = false, required this.finishFormationResultOption}): _participants = participants,_courses = courses;
  

@override@JsonKey() final  bool isLoading;
@override final  FormationDetail? item;
@override final  Option<Either<GlobalFailure, FormationDetail>> resultOption;
@override@JsonKey() final  bool isLoadingParticipants;
 final  List<FormationParticipantRegistration> _participants;
@override@JsonKey() List<FormationParticipantRegistration> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption;
@override@JsonKey() final  bool isLoadingCourses;
 final  List<FormationCourse> _courses;
@override@JsonKey() List<FormationCourse> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}

@override final  Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption;
@override@JsonKey() final  bool isStartingCourse;
@override final  Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption;
@override@JsonKey() final  bool isFinishingCourse;
@override final  Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption;
@override@JsonKey() final  bool? isFinishingFormation;
@override final  Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption;

/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormationDetailStateCopyWith<_FormationDetailState> get copyWith => __$FormationDetailStateCopyWithImpl<_FormationDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormationDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingParticipants, isLoadingParticipants) || other.isLoadingParticipants == isLoadingParticipants)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsResultOption, participantsResultOption) || other.participantsResultOption == participantsResultOption)&&(identical(other.isLoadingCourses, isLoadingCourses) || other.isLoadingCourses == isLoadingCourses)&&const DeepCollectionEquality().equals(other._courses, _courses)&&(identical(other.coursesResultOption, coursesResultOption) || other.coursesResultOption == coursesResultOption)&&(identical(other.isStartingCourse, isStartingCourse) || other.isStartingCourse == isStartingCourse)&&(identical(other.startCourseResultOption, startCourseResultOption) || other.startCourseResultOption == startCourseResultOption)&&(identical(other.isFinishingCourse, isFinishingCourse) || other.isFinishingCourse == isFinishingCourse)&&(identical(other.finishCourseResultOption, finishCourseResultOption) || other.finishCourseResultOption == finishCourseResultOption)&&(identical(other.isFinishingFormation, isFinishingFormation) || other.isFinishingFormation == isFinishingFormation)&&(identical(other.finishFormationResultOption, finishFormationResultOption) || other.finishFormationResultOption == finishFormationResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingParticipants,const DeepCollectionEquality().hash(_participants),participantsResultOption,isLoadingCourses,const DeepCollectionEquality().hash(_courses),coursesResultOption,isStartingCourse,startCourseResultOption,isFinishingCourse,finishCourseResultOption,isFinishingFormation,finishFormationResultOption);

@override
String toString() {
  return 'FormationDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingParticipants: $isLoadingParticipants, participants: $participants, participantsResultOption: $participantsResultOption, isLoadingCourses: $isLoadingCourses, courses: $courses, coursesResultOption: $coursesResultOption, isStartingCourse: $isStartingCourse, startCourseResultOption: $startCourseResultOption, isFinishingCourse: $isFinishingCourse, finishCourseResultOption: $finishCourseResultOption, isFinishingFormation: $isFinishingFormation, finishFormationResultOption: $finishFormationResultOption)';
}


}

/// @nodoc
abstract mixin class _$FormationDetailStateCopyWith<$Res> implements $FormationDetailStateCopyWith<$Res> {
  factory _$FormationDetailStateCopyWith(_FormationDetailState value, $Res Function(_FormationDetailState) _then) = __$FormationDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, FormationDetail? item, Option<Either<GlobalFailure, FormationDetail>> resultOption, bool isLoadingParticipants, List<FormationParticipantRegistration> participants, Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption, bool isLoadingCourses, List<FormationCourse> courses, Option<Either<GlobalFailure, List<FormationCourse>>> coursesResultOption, bool isStartingCourse, Option<Either<GlobalFailure, StartCourseResult>> startCourseResultOption, bool isFinishingCourse, Option<Either<GlobalFailure, FinishCourseResult>> finishCourseResultOption, bool? isFinishingFormation, Option<Either<GlobalFailure, FinishFormationResult>> finishFormationResultOption
});




}
/// @nodoc
class __$FormationDetailStateCopyWithImpl<$Res>
    implements _$FormationDetailStateCopyWith<$Res> {
  __$FormationDetailStateCopyWithImpl(this._self, this._then);

  final _FormationDetailState _self;
  final $Res Function(_FormationDetailState) _then;

/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingParticipants = null,Object? participants = null,Object? participantsResultOption = null,Object? isLoadingCourses = null,Object? courses = null,Object? coursesResultOption = null,Object? isStartingCourse = null,Object? startCourseResultOption = null,Object? isFinishingCourse = null,Object? finishCourseResultOption = null,Object? isFinishingFormation = freezed,Object? finishFormationResultOption = null,}) {
  return _then(_FormationDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FormationDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FormationDetail>>,isLoadingParticipants: null == isLoadingParticipants ? _self.isLoadingParticipants : isLoadingParticipants // ignore: cast_nullable_to_non_nullable
as bool,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<FormationParticipantRegistration>,participantsResultOption: null == participantsResultOption ? _self.participantsResultOption : participantsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationParticipantRegistration>>>,isLoadingCourses: null == isLoadingCourses ? _self.isLoadingCourses : isLoadingCourses // ignore: cast_nullable_to_non_nullable
as bool,courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<FormationCourse>,coursesResultOption: null == coursesResultOption ? _self.coursesResultOption : coursesResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationCourse>>>,isStartingCourse: null == isStartingCourse ? _self.isStartingCourse : isStartingCourse // ignore: cast_nullable_to_non_nullable
as bool,startCourseResultOption: null == startCourseResultOption ? _self.startCourseResultOption : startCourseResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, StartCourseResult>>,isFinishingCourse: null == isFinishingCourse ? _self.isFinishingCourse : isFinishingCourse // ignore: cast_nullable_to_non_nullable
as bool,finishCourseResultOption: null == finishCourseResultOption ? _self.finishCourseResultOption : finishCourseResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FinishCourseResult>>,isFinishingFormation: freezed == isFinishingFormation ? _self.isFinishingFormation : isFinishingFormation // ignore: cast_nullable_to_non_nullable
as bool?,finishFormationResultOption: null == finishFormationResultOption ? _self.finishFormationResultOption : finishFormationResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FinishFormationResult>>,
  ));
}


}

// dart format on
