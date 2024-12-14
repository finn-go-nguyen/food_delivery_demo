// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestaurantState {
  AsyncState<FRestaurant> get restaurant => throw _privateConstructorUsedError;
  AsyncState<List<FFood>> get foods => throw _privateConstructorUsedError;
  AsyncState<FStar> get star => throw _privateConstructorUsedError;
  AsyncState<List<FRating>> get ratings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
  @useResult
  $Res call(
      {AsyncState<FRestaurant> restaurant,
      AsyncState<List<FFood>> foods,
      AsyncState<FStar> star,
      AsyncState<List<FRating>> ratings});

  $AsyncStateCopyWith<FRestaurant, $Res> get restaurant;
  $AsyncStateCopyWith<List<FFood>, $Res> get foods;
  $AsyncStateCopyWith<FStar, $Res> get star;
  $AsyncStateCopyWith<List<FRating>, $Res> get ratings;
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = null,
    Object? foods = null,
    Object? star = null,
    Object? ratings = null,
  }) {
    return _then(_value.copyWith(
      restaurant: null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as AsyncState<FRestaurant>,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<FFood>>,
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
  $AsyncStateCopyWith<FRestaurant, $Res> get restaurant {
    return $AsyncStateCopyWith<FRestaurant, $Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<FFood>, $Res> get foods {
    return $AsyncStateCopyWith<List<FFood>, $Res>(_value.foods, (value) {
      return _then(_value.copyWith(foods: value) as $Val);
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
abstract class _$$_RestaurantStateCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$_RestaurantStateCopyWith(
          _$_RestaurantState value, $Res Function(_$_RestaurantState) then) =
      __$$_RestaurantStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncState<FRestaurant> restaurant,
      AsyncState<List<FFood>> foods,
      AsyncState<FStar> star,
      AsyncState<List<FRating>> ratings});

  @override
  $AsyncStateCopyWith<FRestaurant, $Res> get restaurant;
  @override
  $AsyncStateCopyWith<List<FFood>, $Res> get foods;
  @override
  $AsyncStateCopyWith<FStar, $Res> get star;
  @override
  $AsyncStateCopyWith<List<FRating>, $Res> get ratings;
}

/// @nodoc
class __$$_RestaurantStateCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$_RestaurantState>
    implements _$$_RestaurantStateCopyWith<$Res> {
  __$$_RestaurantStateCopyWithImpl(
      _$_RestaurantState _value, $Res Function(_$_RestaurantState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = null,
    Object? foods = null,
    Object? star = null,
    Object? ratings = null,
  }) {
    return _then(_$_RestaurantState(
      restaurant: null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as AsyncState<FRestaurant>,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<FFood>>,
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

class _$_RestaurantState implements _RestaurantState {
  const _$_RestaurantState(
      {this.restaurant = const AsyncState.loading(),
      this.foods = const AsyncState.loading(),
      this.star = const AsyncState.loading(),
      this.ratings = const AsyncState.loading()});

  @override
  @JsonKey()
  final AsyncState<FRestaurant> restaurant;
  @override
  @JsonKey()
  final AsyncState<List<FFood>> foods;
  @override
  @JsonKey()
  final AsyncState<FStar> star;
  @override
  @JsonKey()
  final AsyncState<List<FRating>> ratings;

  @override
  String toString() {
    return 'RestaurantState(restaurant: $restaurant, foods: $foods, star: $star, ratings: $ratings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantState &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.foods, foods) || other.foods == foods) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.ratings, ratings) || other.ratings == ratings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, restaurant, foods, star, ratings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      __$$_RestaurantStateCopyWithImpl<_$_RestaurantState>(this, _$identity);
}

abstract class _RestaurantState implements RestaurantState {
  const factory _RestaurantState(
      {final AsyncState<FRestaurant> restaurant,
      final AsyncState<List<FFood>> foods,
      final AsyncState<FStar> star,
      final AsyncState<List<FRating>> ratings}) = _$_RestaurantState;

  @override
  AsyncState<FRestaurant> get restaurant;
  @override
  AsyncState<List<FFood>> get foods;
  @override
  AsyncState<FStar> get star;
  @override
  AsyncState<List<FRating>> get ratings;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}
