part of 'rating_cubit.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(5) int star,
    String? review,
  }) = _RatingState;
}
