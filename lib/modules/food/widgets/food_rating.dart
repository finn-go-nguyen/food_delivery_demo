import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/rating_section.dart';

class FoodRating extends StatelessWidget {
  const FoodRating({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingSection(paths: [
      Assets.icons.star.path,
      // Assets.icons.shoppingBag.path,
    ], texts: [
      '${rating.toStringAsFixed(1)} Rating',
      // '${NumberFormat.compact().format(1000)}+ Order',
    ]);
  }
}
