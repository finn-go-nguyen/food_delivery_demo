import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/repositories/rating/rating.dart';
import 'package:food_delivery/repositories/rating/star/star.dart';
import 'package:food_delivery/utils/ui/network_image.dart';
import 'package:intl/intl.dart';

import '../gen/assets.gen.dart';
import '../utils/ui/card.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({
    super.key,
    required this.ratings,
  });

  final List<FRating> ratings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: List.generate(
            ratings.length,
            (index) {
              final rating = ratings[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TestimonialCard(
                  userPhotoUrl: rating.userPhotoUrl ?? '',
                  userName: rating.name ?? 'User',
                  rating: rating.rate,
                  created: rating.created,
                  content: rating.review,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RatingStatisticalSection extends StatelessWidget {
  const RatingStatisticalSection({
    super.key,
    required this.star,
  });

  final FStar star;

  @override
  Widget build(BuildContext context) {
    final average = star.average;
    final total = star.total == 0 ? 1 : star.total;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              average.toStringAsFixed(1),
              style: FTextStyles.heading1.copyWith(
                color: FColors.green,
                fontSize: 60.0,
              ),
            ),
            RatingBarIndicator(
              rating: average,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemSize: 14.0,
              itemBuilder: (context, index) =>
                  Image.asset(Assets.icons.starFull.path),
            ),
            gapH4,
            Text(
              NumberFormat.compact().format(star.total),
            ),
          ],
        ),
        gapW24,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              RatingPercentageBar(label: '5', percentage: star.five / total),
              RatingPercentageBar(label: '4', percentage: star.four / total),
              RatingPercentageBar(label: '3', percentage: star.three / total),
              RatingPercentageBar(label: '2', percentage: star.two / total),
              RatingPercentageBar(label: '1', percentage: star.one / total),
            ],
          ),
        )
      ],
    );
  }
}

class RatingPercentageBar extends StatelessWidget {
  const RatingPercentageBar({
    super.key,
    required this.label,
    required this.percentage,
  });

  final String label;

  /// 0.0 -> 1.0
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        gapW12,
        Expanded(
          child: ClipRRect(
            borderRadius: Ui.borderRadius,
            child: LinearProgressIndicator(
              value: percentage,
              color: FColors.green,
              backgroundColor: FColors.loading,
              minHeight: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.userPhotoUrl,
    required this.userName,
    required this.rating,
    required this.created,
    this.content,
  });

  final String userPhotoUrl;
  final String userName;
  final int rating;
  final DateTime created;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return FCard(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: Ui.borderRadius,
                child: SizedBox.square(
                  dimension: 40.0,
                  child: FNetworkImage(
                    userPhotoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gapW8,
              Text(
                userName,
                style: FTextStyles.heading5,
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              RatingBarIndicator(
                rating: rating.toDouble(),
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemSize: 14.0,
                itemBuilder: (context, index) =>
                    Image.asset(Assets.icons.starFull.path),
              ),
              gapW8,
              Text(
                DateFormat('MMM dd, y').format(created),
              ),
            ],
          ),
          gapH8,
          content == null
              ? const SizedBox()
              : Text(
                  content!,
                  style: FTextStyles.body.copyWith(
                    height: 1.5,
                  ),
                ),
        ],
      ),
    );
  }
}
