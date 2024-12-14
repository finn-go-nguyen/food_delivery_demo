import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/helpers/text_helpers.dart';
import '../../../widgets/rating_section.dart';

class RestaurantRating extends StatelessWidget {
  const RestaurantRating({
    super.key,
    required this.meters,
    required this.rating,
  });

  final int meters;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingSection(paths: [
      Assets.icons.locationPinOutlined.path,
      Assets.icons.star.path,
    ], texts: [
      StringExtension.toKm(meters),
      '${rating.toStringAsFixed(1)} Rating',
    ]);
  }
}
