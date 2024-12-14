import 'package:flutter/material.dart';
import 'package:food_delivery/config/routes/coordinator.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/constants.dart';

import '../../../../repositories/food/food_model.dart';
import '../../../../utils/ui/network_image.dart';
import '../../model/order.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.quantity,
    required this.food,
    required this.status,
  });

  final int quantity;
  final FFood food;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.orderDetailsCardHeight,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: Ui.borderRadius,
            child: SizedBox.square(
              dimension: 100.0,
              child: FNetworkImage(food.img),
            ),
          ),
          gapW12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyles.heading5,
                ),
                Text(
                  food.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyles.label.copyWith(
                    color: Colors.grey,
                    height: 1.1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.price.toInt()} × $quantity',
                      style: FTextStyles.heading4.copyWith(
                        color: FColors.green,
                      ),
                    ),
                    status == OrderStatus.delivered
                        ? SizedBox(
                            height: 35.0,
                            child: OutlinedButton.icon(
                              onPressed: () => context
                                  .pushNamed(Routes.review.name, extra: food),
                              icon: const Icon(
                                Icons.edit,
                                size: 20.0,
                                color: FColors.green,
                              ),
                              label: Text(
                                'Write a review',
                                style: FTextStyles.button.copyWith(
                                  color: FColors.green,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
