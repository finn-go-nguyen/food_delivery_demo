import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class FRating extends Equatable with _$FRating {
  const FRating._();
  const factory FRating({
    String? id,
    required int rate,
    required DateTime created,
    required String uid,
    required String foodId,
    required String restaurantId,
    String? userPhotoUrl,
    String? name,
    String? review,
  }) = _FRating;

  factory FRating.fromJson(Map<String, Object?> json) =>
      _$FRatingFromJson(json);

  @override
  List<Object?> get props => [
        id,
        rate,
        created,
        uid,
        foodId,
        restaurantId,
        userPhotoUrl,
        name,
        review,
      ];
}
