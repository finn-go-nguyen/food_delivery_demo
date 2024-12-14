// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RatingState {
  FormzStatus get status => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingStateCopyWith<RatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingStateCopyWith<$Res> {
  factory $RatingStateCopyWith(
          RatingState value, $Res Function(RatingState) then) =
      _$RatingStateCopyWithImpl<$Res, RatingState>;
  @useResult
  $Res call({FormzStatus status, int star, String? review});
}

/// @nodoc
class _$RatingStateCopyWithImpl<$Res, $Val extends RatingState>
    implements $RatingStateCopyWith<$Res> {
  _$RatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? star = null,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingStateCopyWith<$Res>
    implements $RatingStateCopyWith<$Res> {
  factory _$$_RatingStateCopyWith(
          _$_RatingState value, $Res Function(_$_RatingState) then) =
      __$$_RatingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus status, int star, String? review});
}

/// @nodoc
class __$$_RatingStateCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$_RatingState>
    implements _$$_RatingStateCopyWith<$Res> {
  __$$_RatingStateCopyWithImpl(
      _$_RatingState _value, $Res Function(_$_RatingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? star = null,
    Object? review = freezed,
  }) {
    return _then(_$_RatingState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RatingState implements _RatingState {
  const _$_RatingState(
      {this.status = FormzStatus.pure, this.star = 5, this.review});

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final int star;
  @override
  final String? review;

  @override
  String toString() {
    return 'RatingState(status: $status, star: $star, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, star, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingStateCopyWith<_$_RatingState> get copyWith =>
      __$$_RatingStateCopyWithImpl<_$_RatingState>(this, _$identity);
}

abstract class _RatingState implements RatingState {
  const factory _RatingState(
      {final FormzStatus status,
      final int star,
      final String? review}) = _$_RatingState;

  @override
  FormzStatus get status;
  @override
  int get star;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$_RatingStateCopyWith<_$_RatingState> get copyWith =>
      throw _privateConstructorUsedError;
}
