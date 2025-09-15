// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure<T> {

 int? get code; String? get msg; ExceptionType get exceptionType; T? get content; Object? get object;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this as Failure<T>, _$identity);

  /// Serializes this Failure to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.exceptionType, exceptionType) || other.exceptionType == exceptionType)&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.object, object));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,msg,exceptionType,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(object));

@override
String toString() {
  return 'Failure<$T>(code: $code, msg: $msg, exceptionType: $exceptionType, content: $content, object: $object)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T,$Res>  {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 int? code, String? msg, ExceptionType exceptionType, T? content, Object? object
});




}
/// @nodoc
class _$FailureCopyWithImpl<T,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? msg = freezed,Object? exceptionType = null,Object? content = freezed,Object? object = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,exceptionType: null == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as ExceptionType,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as T?,object: freezed == object ? _self.object : object ,
  ));
}

}


/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Failure<T> implements Failure<T> {
  const _Failure({this.code = 0, this.msg = "", this.exceptionType = ExceptionType.none, this.content, this.object});
  factory _Failure.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$FailureFromJson(json,fromJsonT);

@override@JsonKey() final  int? code;
@override@JsonKey() final  String? msg;
@override@JsonKey() final  ExceptionType exceptionType;
@override final  T? content;
@override final  Object? object;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<T, _Failure<T>> get copyWith => __$FailureCopyWithImpl<T, _Failure<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$FailureToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.exceptionType, exceptionType) || other.exceptionType == exceptionType)&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.object, object));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,msg,exceptionType,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(object));

@override
String toString() {
  return 'Failure<$T>(code: $code, msg: $msg, exceptionType: $exceptionType, content: $content, object: $object)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<T,$Res> implements $FailureCopyWith<T, $Res> {
  factory _$FailureCopyWith(_Failure<T> value, $Res Function(_Failure<T>) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 int? code, String? msg, ExceptionType exceptionType, T? content, Object? object
});




}
/// @nodoc
class __$FailureCopyWithImpl<T,$Res>
    implements _$FailureCopyWith<T, $Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure<T> _self;
  final $Res Function(_Failure<T>) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? msg = freezed,Object? exceptionType = null,Object? content = freezed,Object? object = freezed,}) {
  return _then(_Failure<T>(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,exceptionType: null == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as ExceptionType,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as T?,object: freezed == object ? _self.object : object ,
  ));
}


}

// dart format on
