// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FRating _$FRatingFromJson(Map<String, dynamic> json) {
  return _FRating.fromJson(json);
}

/// @nodoc
mixin _$FRating {
  String? get id => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get foodId => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String? get userPhotoUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FRatingCopyWith<FRating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FRatingCopyWith<$Res> {
  factory $FRatingCopyWith(FRating value, $Res Function(FRating) then) =
      _$FRatingCopyWithImpl<$Res, FRating>;
  @useResult
  $Res call(
      {String? id,
      int rate,
      DateTime created,
      String uid,
      String foodId,
      String restaurantId,
      String? userPhotoUrl,
      String? name,
      String? review});
}

/// @nodoc
class _$FRatingCopyWithImpl<$Res, $Val extends FRating>
    implements $FRatingCopyWith<$Res> {
  _$FRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = null,
    Object? created = null,
    Object? uid = null,
    Object? foodId = null,
    Object? restaurantId = null,
    Object? userPhotoUrl = freezed,
    Object? name = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: freezed == userPhotoUrl
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FRatingCopyWith<$Res> implements $FRatingCopyWith<$Res> {
  factory _$$_FRatingCopyWith(
          _$_FRating value, $Res Function(_$_FRating) then) =
      __$$_FRatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int rate,
      DateTime created,
      String uid,
      String foodId,
      String restaurantId,
      String? userPhotoUrl,
      String? name,
      String? review});
}

/// @nodoc
class __$$_FRatingCopyWithImpl<$Res>
    extends _$FRatingCopyWithImpl<$Res, _$_FRating>
    implements _$$_FRatingCopyWith<$Res> {
  __$$_FRatingCopyWithImpl(_$_FRating _value, $Res Function(_$_FRating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = null,
    Object? created = null,
    Object? uid = null,
    Object? foodId = null,
    Object? restaurantId = null,
    Object? userPhotoUrl = freezed,
    Object? name = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_FRating(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: freezed == userPhotoUrl
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FRating extends _FRating {
  const _$_FRating(
      {this.id,
      required this.rate,
      required this.created,
      required this.uid,
      required this.foodId,
      required this.restaurantId,
      this.userPhotoUrl,
      this.name,
      this.review})
      : super._();

  factory _$_FRating.fromJson(Map<String, dynamic> json) =>
      _$$_FRatingFromJson(json);

  @override
  final String? id;
  @override
  final int rate;
  @override
  final DateTime created;
  @override
  final String uid;
  @override
  final String foodId;
  @override
  final String restaurantId;
  @override
  final String? userPhotoUrl;
  @override
  final String? name;
  @override
  final String? review;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FRatingCopyWith<_$_FRating> get copyWith =>
      __$$_FRatingCopyWithImpl<_$_FRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FRatingToJson(
      this,
    );
  }
}

abstract class _FRating extends FRating {
  const factory _FRating(
      {final String? id,
      required final int rate,
      required final DateTime created,
      required final String uid,
      required final String foodId,
      required final String restaurantId,
      final String? userPhotoUrl,
      final String? name,
      final String? review}) = _$_FRating;
  const _FRating._() : super._();

  factory _FRating.fromJson(Map<String, dynamic> json) = _$_FRating.fromJson;

  @override
  String? get id;
  @override
  int get rate;
  @override
  DateTime get created;
  @override
  String get uid;
  @override
  String get foodId;
  @override
  String get restaurantId;
  @override
  String? get userPhotoUrl;
  @override
  String? get name;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$_FRatingCopyWith<_$_FRating> get copyWith =>
      throw _privateConstructorUsedError;
}
