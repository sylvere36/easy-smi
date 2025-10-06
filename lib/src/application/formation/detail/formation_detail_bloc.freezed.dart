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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchRequested value)?  fetchRequested,TResult Function( _Reset value)?  reset,TResult Function( _ParticipantsRequested value)?  participantsRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchRequested value)  fetchRequested,required TResult Function( _Reset value)  reset,required TResult Function( _ParticipantsRequested value)  participantsRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that);case _Reset():
return reset(_that);case _ParticipantsRequested():
return participantsRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchRequested value)?  fetchRequested,TResult? Function( _Reset value)?  reset,TResult? Function( _ParticipantsRequested value)?  participantsRequested,}){
final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _Reset() when reset != null:
return reset(_that);case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchRequested,TResult Function()?  reset,TResult Function( int id)?  participantsRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchRequested,required TResult Function()  reset,required TResult Function( int id)  participantsRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested():
return fetchRequested(_that.id);case _Reset():
return reset();case _ParticipantsRequested():
return participantsRequested(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchRequested,TResult? Function()?  reset,TResult? Function( int id)?  participantsRequested,}) {final _that = this;
switch (_that) {
case _FetchRequested() when fetchRequested != null:
return fetchRequested(_that.id);case _Reset() when reset != null:
return reset();case _ParticipantsRequested() when participantsRequested != null:
return participantsRequested(_that.id);case _:
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
mixin _$FormationDetailState {

 bool get isLoading; FormationDetail? get item; Option<Either<GlobalFailure, FormationDetail>> get resultOption; bool get isLoadingParticipants; List<FormationParticipantRegistration> get participants; Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> get participantsResultOption;
/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormationDetailStateCopyWith<FormationDetailState> get copyWith => _$FormationDetailStateCopyWithImpl<FormationDetailState>(this as FormationDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingParticipants, isLoadingParticipants) || other.isLoadingParticipants == isLoadingParticipants)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsResultOption, participantsResultOption) || other.participantsResultOption == participantsResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingParticipants,const DeepCollectionEquality().hash(participants),participantsResultOption);

@override
String toString() {
  return 'FormationDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingParticipants: $isLoadingParticipants, participants: $participants, participantsResultOption: $participantsResultOption)';
}


}

/// @nodoc
abstract mixin class $FormationDetailStateCopyWith<$Res>  {
  factory $FormationDetailStateCopyWith(FormationDetailState value, $Res Function(FormationDetailState) _then) = _$FormationDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, FormationDetail? item, Option<Either<GlobalFailure, FormationDetail>> resultOption, bool isLoadingParticipants, List<FormationParticipantRegistration> participants, Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingParticipants = null,Object? participants = null,Object? participantsResultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FormationDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FormationDetail>>,isLoadingParticipants: null == isLoadingParticipants ? _self.isLoadingParticipants : isLoadingParticipants // ignore: cast_nullable_to_non_nullable
as bool,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<FormationParticipantRegistration>,participantsResultOption: null == participantsResultOption ? _self.participantsResultOption : participantsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationParticipantRegistration>>>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption)  $default,) {final _that = this;
switch (_that) {
case _FormationDetailState():
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  FormationDetail? item,  Option<Either<GlobalFailure, FormationDetail>> resultOption,  bool isLoadingParticipants,  List<FormationParticipantRegistration> participants,  Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption)?  $default,) {final _that = this;
switch (_that) {
case _FormationDetailState() when $default != null:
return $default(_that.isLoading,_that.item,_that.resultOption,_that.isLoadingParticipants,_that.participants,_that.participantsResultOption);case _:
  return null;

}
}

}

/// @nodoc


class _FormationDetailState implements FormationDetailState {
  const _FormationDetailState({required this.isLoading, required this.item, required this.resultOption, this.isLoadingParticipants = false, final  List<FormationParticipantRegistration> participants = const [], required this.participantsResultOption}): _participants = participants;
  

@override final  bool isLoading;
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

/// Create a copy of FormationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormationDetailStateCopyWith<_FormationDetailState> get copyWith => __$FormationDetailStateCopyWithImpl<_FormationDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormationDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.item, item) || other.item == item)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption)&&(identical(other.isLoadingParticipants, isLoadingParticipants) || other.isLoadingParticipants == isLoadingParticipants)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsResultOption, participantsResultOption) || other.participantsResultOption == participantsResultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,item,resultOption,isLoadingParticipants,const DeepCollectionEquality().hash(_participants),participantsResultOption);

@override
String toString() {
  return 'FormationDetailState(isLoading: $isLoading, item: $item, resultOption: $resultOption, isLoadingParticipants: $isLoadingParticipants, participants: $participants, participantsResultOption: $participantsResultOption)';
}


}

/// @nodoc
abstract mixin class _$FormationDetailStateCopyWith<$Res> implements $FormationDetailStateCopyWith<$Res> {
  factory _$FormationDetailStateCopyWith(_FormationDetailState value, $Res Function(_FormationDetailState) _then) = __$FormationDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, FormationDetail? item, Option<Either<GlobalFailure, FormationDetail>> resultOption, bool isLoadingParticipants, List<FormationParticipantRegistration> participants, Option<Either<GlobalFailure, List<FormationParticipantRegistration>>> participantsResultOption
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? item = freezed,Object? resultOption = null,Object? isLoadingParticipants = null,Object? participants = null,Object? participantsResultOption = null,}) {
  return _then(_FormationDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FormationDetail?,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, FormationDetail>>,isLoadingParticipants: null == isLoadingParticipants ? _self.isLoadingParticipants : isLoadingParticipants // ignore: cast_nullable_to_non_nullable
as bool,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<FormationParticipantRegistration>,participantsResultOption: null == participantsResultOption ? _self.participantsResultOption : participantsResultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<FormationParticipantRegistration>>>,
  ));
}


}

// dart format on
