import 'package:cloud_firestore/cloud_firestore.dart';

import '../../result.dart';
import 'star.dart';

class StarCountRepository {
  const StarCountRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<FResult<FStar>> getFoodStar(
    String restaurantId,
    String foodId,
  ) async {
    try {
      final ref = _firestore.collection('ratingCounts');
      final documentSnapshot = await ref.doc(restaurantId).get();

      return FResult.success(
        FStar.fromJson(
          documentSnapshot.data()?[foodId] ?? const FStar().toJson(),
        ),
      );
    } catch (e) {
      return FResult.exception(e);
    }
  }

  Future<FResult<FStar>> getRestaurantStar(
    String restaurantId,
  ) async {
    try {
      final ref = _firestore.collection('ratingCounts');
      final documentSnapshot = await ref.doc(restaurantId).get();

      if (!documentSnapshot.exists) {
        return FResult.success(const FStar());
      }

      final foodStars =
          documentSnapshot.data()!.values.map((e) => FStar.fromJson(e));
      final result = FStar(
        one: foodStars.fold(
            0, (previousValue, element) => previousValue + element.one),
        two: foodStars.fold(
            0, (previousValue, element) => previousValue + element.two),
        three: foodStars.fold(
            0, (previousValue, element) => previousValue + element.three),
        four: foodStars.fold(
            0, (previousValue, element) => previousValue + element.four),
        five: foodStars.fold(
            0, (previousValue, element) => previousValue + element.five),
      );
      return FResult.success(result);
    } catch (e) {
      return FResult.exception(e);
    }
  }
}
