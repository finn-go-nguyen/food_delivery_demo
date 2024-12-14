part of 'food_cubit.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState({
    @Default(AsyncState.loading()) AsyncState<FFood> food,
    @Default(AsyncState.loading()) AsyncState<FStar> star,
    @Default(AsyncState.loading()) AsyncState<List<FRating>> ratings,
  }) = _FoodState;
}
