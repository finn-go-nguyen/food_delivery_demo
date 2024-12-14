// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FStar _$FStarFromJson(Map<String, dynamic> json) {
  return _FStar.fromJson(json);
}

/// @nodoc
mixin _$FStar {
  int get one => throw _privateConstructorUsedError;
  int get two => throw _privateConstructorUsedError;
  int get three => throw _privateConstructorUsedError;
  int get four => throw _privateConstructorUsedError;
  int get five => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FStarCopyWith<FStar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FStarCopyWith<$Res> {
  factory $FStarCopyWith(FStar value, $Res Function(FStar) then) =
      _$FStarCopyWithImpl<$Res, FStar>;
  @useResult
  $Res call({int one, int two, int three, int four, int five});
}

/// @nodoc
class _$FStarCopyWithImpl<$Res, $Val extends FStar>
    implements $FStarCopyWith<$Res> {
  _$FStarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? one = null,
    Object? two = null,
    Object? three = null,
    Object? four = null,
    Object? five = null,
  }) {
    return _then(_value.copyWith(
      one: null == one
          ? _value.one
          : one // ignore: cast_nullable_to_non_nullable
              as int,
      two: null == two
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as int,
      three: null == three
          ? _value.three
          : three // ignore: cast_nullable_to_non_nullable
              as int,
      four: null == four
          ? _value.four
          : four // ignore: cast_nullable_to_non_nullable
              as int,
      five: null == five
          ? _value.five
          : five // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FStarCopyWith<$Res> implements $FStarCopyWith<$Res> {
  factory _$$_FStarCopyWith(_$_FStar value, $Res Function(_$_FStar) then) =
      __$$_FStarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int one, int two, int three, int four, int five});
}

/// @nodoc
class __$$_FStarCopyWithImpl<$Res> extends _$FStarCopyWithImpl<$Res, _$_FStar>
    implements _$$_FStarCopyWith<$Res> {
  __$$_FStarCopyWithImpl(_$_FStar _value, $Res Function(_$_FStar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? one = null,
    Object? two = null,
    Object? three = null,
    Object? four = null,
    Object? five = null,
  }) {
    return _then(_$_FStar(
      one: null == one
          ? _value.one
          : one // ignore: cast_nullable_to_non_nullable
              as int,
      two: null == two
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as int,
      three: null == three
          ? _value.three
          : three // ignore: cast_nullable_to_non_nullable
              as int,
      four: null == four
          ? _value.four
          : four // ignore: cast_nullable_to_non_nullable
              as int,
      five: null == five
          ? _value.five
          : five // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FStar extends _FStar {
  const _$_FStar(
      {this.one = 0,
      this.two = 0,
      this.three = 0,
      this.four = 0,
      this.five = 0})
      : super._();

  factory _$_FStar.fromJson(Map<String, dynamic> json) =>
      _$$_FStarFromJson(json);

  @override
  @JsonKey()
  final int one;
  @override
  @JsonKey()
  final int two;
  @override
  @JsonKey()
  final int three;
  @override
  @JsonKey()
  final int four;
  @override
  @JsonKey()
  final int five;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FStarCopyWith<_$_FStar> get copyWith =>
      __$$_FStarCopyWithImpl<_$_FStar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FStarToJson(
      this,
    );
  }
}

abstract class _FStar extends FStar {
  const factory _FStar(
      {final int one,
      final int two,
      final int three,
      final int four,
      final int five}) = _$_FStar;
  const _FStar._() : super._();

  factory _FStar.fromJson(Map<String, dynamic> json) = _$_FStar.fromJson;

  @override
  int get one;
  @override
  int get two;
  @override
  int get three;
  @override
  int get four;
  @override
  int get five;
  @override
  @JsonKey(ignore: true)
  _$$_FStarCopyWith<_$_FStar> get copyWith =>
      throw _privateConstructorUsedError;
}
