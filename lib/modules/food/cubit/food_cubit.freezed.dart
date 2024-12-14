// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodState {
  AsyncState<FFood> get food => throw _privateConstructorUsedError;
  AsyncState<FStar> get star => throw _privateConstructorUsedError;
  AsyncState<List<FRating>> get ratings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodStateCopyWith<FoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodStateCopyWith<$Res> {
  factory $FoodStateCopyWith(FoodState value, $Res Function(FoodState) then) =
      _$FoodStateCopyWithImpl<$Res, FoodState>;
  @useResult
  $Res call(
      {AsyncState<FFood> food,
      AsyncState<FStar> star,
      AsyncState<List<FRating>> ratings});

  $AsyncStateCopyWith<FFood, $Res> get food;
  $AsyncStateCopyWith<FStar, $Res> get star;
  $AsyncStateCopyWith<List<FRating>, $Res> get ratings;
}

/// @nodoc
class _$FoodStateCopyWithImpl<$Res, $Val extends FoodState>
    implements $FoodStateCopyWith<$Res> {
  _$FoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? star = null,
    Object? ratings = null,
  }) {
    return _then(_value.copyWith(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as AsyncState<FFood>,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as AsyncState<FStar>,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<FRating>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<FFood, $Res> get food {
    return $AsyncStateCopyWith<FFood, $Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<FStar, $Res> get star {
    return $AsyncStateCopyWith<FStar, $Res>(_value.star, (value) {
      return _then(_value.copyWith(star: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<FRating>, $Res> get ratings {
    return $AsyncStateCopyWith<List<FRating>, $Res>(_value.ratings, (value) {
      return _then(_value.copyWith(ratings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FoodStateCopyWith<$Res> implements $FoodStateCopyWith<$Res> {
  factory _$$_FoodStateCopyWith(
          _$_FoodState value, $Res Function(_$_FoodState) then) =
      __$$_FoodStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncState<FFood> food,
      AsyncState<FStar> star,
      AsyncState<List<FRating>> ratings});

  @override
  $AsyncStateCopyWith<FFood, $Res> get food;
  @override
  $AsyncStateCopyWith<FStar, $Res> get star;
  @override
  $AsyncStateCopyWith<List<FRating>, $Res> get ratings;
}

/// @nodoc
class __$$_FoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$_FoodState>
    implements _$$_FoodStateCopyWith<$Res> {
  __$$_FoodStateCopyWithImpl(
      _$_FoodState _value, $Res Function(_$_FoodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? star = null,
    Object? ratings = null,
  }) {
    return _then(_$_FoodState(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as AsyncState<FFood>,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as AsyncState<FStar>,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<FRating>>,
    ));
  }
}

/// @nodoc

class _$_FoodState implements _FoodState {
  const _$_FoodState(
      {this.food = const AsyncState.loading(),
      this.star = const AsyncState.loading(),
      this.ratings = const AsyncState.loading()});

  @override
  @JsonKey()
  final AsyncState<FFood> food;
  @override
  @JsonKey()
  final AsyncState<FStar> star;
  @override
  @JsonKey()
  final AsyncState<List<FRating>> ratings;

  @override
  String toString() {
    return 'FoodState(food: $food, star: $star, ratings: $ratings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodState &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.ratings, ratings) || other.ratings == ratings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, star, ratings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodStateCopyWith<_$_FoodState> get copyWith =>
      __$$_FoodStateCopyWithImpl<_$_FoodState>(this, _$identity);
}

abstract class _FoodState implements FoodState {
  const factory _FoodState(
      {final AsyncState<FFood> food,
      final AsyncState<FStar> star,
      final AsyncState<List<FRating>> ratings}) = _$_FoodState;

  @override
  AsyncState<FFood> get food;
  @override
  AsyncState<FStar> get star;
  @override
  AsyncState<List<FRating>> get ratings;
  @override
  @JsonKey(ignore: true)
  _$$_FoodStateCopyWith<_$_FoodState> get copyWith =>
      throw _privateConstructorUsedError;
}
