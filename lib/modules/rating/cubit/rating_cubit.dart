import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/repositories/rating/rating_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repositories/rating/rating.dart';

part 'rating_state.dart';
part 'rating_cubit.freezed.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this._ratingRepository) : super(const RatingState());

  final RatingRepository _ratingRepository;

  void onStarChanged(double value) {
    emit(state.copyWith(star: value.floor()));
  }

  void onReviewChanged(String value) {
    emit(state.copyWith(review: value));
  }

  void submit(String uid, String foodId, String restaurantId,
      {required void Function() onReviewAddSuccessfully}) async {
    FRating rating = FRating(
      rate: state.star,
      review: state.review,
      created: DateTime.now(),
      uid: uid,
      foodId: foodId,
      restaurantId: restaurantId,
    );

    final result = await _ratingRepository.add(rating);

    if (result.isError) {}

    onReviewAddSuccessfully();
  }
}
