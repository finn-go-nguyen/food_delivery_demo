part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(AsyncState.loading()) AsyncState<FRestaurant> restaurant,
    @Default(AsyncState.loading()) AsyncState<List<FFood>> foods,
    @Default(AsyncState.loading()) AsyncState<FStar> star,
    @Default(AsyncState.loading()) AsyncState<List<FRating>> ratings,
  }) = _RestaurantState;
}
