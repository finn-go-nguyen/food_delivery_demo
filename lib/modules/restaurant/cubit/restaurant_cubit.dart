import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/base/async_state.dart';
import 'package:food_delivery/repositories/rating/rating.dart';
import 'package:food_delivery/repositories/rating/rating_repository.dart';
import 'package:food_delivery/repositories/rating/star/star.dart';
import 'package:food_delivery/repositories/rating/star/star_count_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repositories/food/food_model.dart';
import '../../../repositories/food/food_repository.dart';
import '../../../repositories/restaurants/restaurant_model.dart';

part 'restaurant_state.dart';
part 'restaurant_cubit.freezed.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(
    this._foodRepository,
    this._starCountRepository,
    this._ratingRepository,
  ) : super(const RestaurantState());

  final FoodRepository _foodRepository;
  final StarCountRepository _starCountRepository;
  final RatingRepository _ratingRepository;

  void init(FRestaurant restaurant) async {
    emit(state.copyWith(restaurant: AsyncState.data(restaurant)));

    fetchFirstFoodBatch(restaurant.foodIds);
    fetchStar(restaurant.id);
    fetchFirstReviewBatch(restaurant.id);
  }

  void fetchFirstFoodBatch(List<String> foodIds) async {
    emit(state.copyWith(foods: const AsyncState.loading()));

    final result = await _foodRepository
        .fetchFoodsByIds(foodIds.sublist(0, min(5, foodIds.length)));

    if (result.isError) {
      emit(state.copyWith(
        foods: AsyncState.error(result.error!),
      ));
      return;
    }

    emit(state.copyWith(foods: AsyncState.data(result.data!)));
  }

  void fetchStar(restaurantId) async {
    emit(state.copyWith(star: const AsyncState.loading()));

    final result = await _starCountRepository.getRestaurantStar(restaurantId);

    if (result.isError) {
      emit(state.copyWith(
        star: AsyncState.error(result.error!),
      ));
      return;
    }

    emit(state.copyWith(star: AsyncState.data(result.data!)));
  }

  void fetchFirstReviewBatch(String restaurantId) async {
    emit(state.copyWith(ratings: const AsyncState.loading()));

    final result =
        await _ratingRepository.fetchRatingsByRestaurantId(restaurantId);

    if (result.isError) {
      emit(state.copyWith(
        ratings: AsyncState.error(result.error!),
      ));
      return;
    }

    final reviews = result.data!;

    if (reviews.isEmpty) {
      emit(state.copyWith(ratings: const AsyncState.empty()));
      return;
    }

    emit(state.copyWith(ratings: AsyncState.data(result.data!)));
  }
}
