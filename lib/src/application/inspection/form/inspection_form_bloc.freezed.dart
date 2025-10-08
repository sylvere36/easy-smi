// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InspectionFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionFormEvent()';
}


}

/// @nodoc
class $InspectionFormEventCopyWith<$Res>  {
$InspectionFormEventCopyWith(InspectionFormEvent _, $Res Function(InspectionFormEvent) __);
}


/// Adds pattern-matching-related methods to [InspectionFormEvent].
extension InspectionFormEventPatterns on InspectionFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int inspectionFormId)?  fetch,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.inspectionFormId);case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int inspectionFormId)  fetch,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.inspectionFormId);case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int inspectionFormId)?  fetch,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.inspectionFormId);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements InspectionFormEvent {
  const _Fetch({required this.inspectionFormId});
  

 final  int inspectionFormId;

/// Create a copy of InspectionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCopyWith<_Fetch> get copyWith => __$FetchCopyWithImpl<_Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch&&(identical(other.inspectionFormId, inspectionFormId) || other.inspectionFormId == inspectionFormId));
}


@override
int get hashCode => Object.hash(runtimeType,inspectionFormId);

@override
String toString() {
  return 'InspectionFormEvent.fetch(inspectionFormId: $inspectionFormId)';
}


}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $InspectionFormEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) = __$FetchCopyWithImpl;
@useResult
$Res call({
 int inspectionFormId
});




}
/// @nodoc
class __$FetchCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

/// Create a copy of InspectionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inspectionFormId = null,}) {
  return _then(_Fetch(
inspectionFormId: null == inspectionFormId ? _self.inspectionFormId : inspectionFormId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements InspectionFormEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectionFormEvent.reset()';
}


}




/// @nodoc
mixin _$InspectionFormState {

 bool get isLoading; List<InspectionSectionWithQuestions> get sections; Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> get resultOption;
/// Create a copy of InspectionFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionFormStateCopyWith<InspectionFormState> get copyWith => _$InspectionFormStateCopyWithImpl<InspectionFormState>(this as InspectionFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(sections),resultOption);

@override
String toString() {
  return 'InspectionFormState(isLoading: $isLoading, sections: $sections, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class $InspectionFormStateCopyWith<$Res>  {
  factory $InspectionFormStateCopyWith(InspectionFormState value, $Res Function(InspectionFormState) _then) = _$InspectionFormStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<InspectionSectionWithQuestions> sections, Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption
});




}
/// @nodoc
class _$InspectionFormStateCopyWithImpl<$Res>
    implements $InspectionFormStateCopyWith<$Res> {
  _$InspectionFormStateCopyWithImpl(this._self, this._then);

  final InspectionFormState _self;
  final $Res Function(InspectionFormState) _then;

/// Create a copy of InspectionFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? sections = null,Object? resultOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<InspectionSectionWithQuestions>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [InspectionFormState].
extension InspectionFormStatePatterns on InspectionFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectionFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectionFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectionFormState value)  $default,){
final _that = this;
switch (_that) {
case _InspectionFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectionFormState value)?  $default,){
final _that = this;
switch (_that) {
case _InspectionFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<InspectionSectionWithQuestions> sections,  Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectionFormState() when $default != null:
return $default(_that.isLoading,_that.sections,_that.resultOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<InspectionSectionWithQuestions> sections,  Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption)  $default,) {final _that = this;
switch (_that) {
case _InspectionFormState():
return $default(_that.isLoading,_that.sections,_that.resultOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<InspectionSectionWithQuestions> sections,  Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption)?  $default,) {final _that = this;
switch (_that) {
case _InspectionFormState() when $default != null:
return $default(_that.isLoading,_that.sections,_that.resultOption);case _:
  return null;

}
}

}

/// @nodoc


class _InspectionFormState implements InspectionFormState {
  const _InspectionFormState({required this.isLoading, required final  List<InspectionSectionWithQuestions> sections, required this.resultOption}): _sections = sections;
  

@override final  bool isLoading;
 final  List<InspectionSectionWithQuestions> _sections;
@override List<InspectionSectionWithQuestions> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption;

/// Create a copy of InspectionFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionFormStateCopyWith<_InspectionFormState> get copyWith => __$InspectionFormStateCopyWithImpl<_InspectionFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectionFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.resultOption, resultOption) || other.resultOption == resultOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_sections),resultOption);

@override
String toString() {
  return 'InspectionFormState(isLoading: $isLoading, sections: $sections, resultOption: $resultOption)';
}


}

/// @nodoc
abstract mixin class _$InspectionFormStateCopyWith<$Res> implements $InspectionFormStateCopyWith<$Res> {
  factory _$InspectionFormStateCopyWith(_InspectionFormState value, $Res Function(_InspectionFormState) _then) = __$InspectionFormStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<InspectionSectionWithQuestions> sections, Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>> resultOption
});




}
/// @nodoc
class __$InspectionFormStateCopyWithImpl<$Res>
    implements _$InspectionFormStateCopyWith<$Res> {
  __$InspectionFormStateCopyWithImpl(this._self, this._then);

  final _InspectionFormState _self;
  final $Res Function(_InspectionFormState) _then;

/// Create a copy of InspectionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? sections = null,Object? resultOption = null,}) {
  return _then(_InspectionFormState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<InspectionSectionWithQuestions>,resultOption: null == resultOption ? _self.resultOption : resultOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>,
  ));
}


}

// dart format on
