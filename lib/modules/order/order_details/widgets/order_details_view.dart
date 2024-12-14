import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/constants.dart';
import '../../cubit/orders_cubit.dart';
import '../cubit/order_details_cubit.dart';
import 'order_details_card.dart';
import '../../../../repositories/food/food_model.dart';
import 'package:intl/intl.dart';

import '../../model/order.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.order,
    required this.foods,
  });

  final FOrder order;
  final List<FFood> foods;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Order ID: ',
                  style: FTextStyles.body,
                  children: [
                    TextSpan(
                      text: '${order.id.hashCode}',
                      style: FTextStyles.label.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: FColors.green,
                  ),
                  gapW4,
                  Text(
                    DateFormat('d MMM yyyy HH:mm').format(order.created),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Item: ',
                  style: FTextStyles.body,
                  children: [
                    TextSpan(
                      text: '${order.cart.items.length}',
                      style: FTextStyles.label.copyWith(
                        fontWeight: FontWeight.bold,
                        color: FColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                final color = order.status == OrderStatus.delivered
                    ? FColors.green
                    : order.status == OrderStatus.cancelled
                        ? Colors.red
                        : FColors.metallicOrange;
                return Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.0,
                      color: color,
                    ),
                    gapW4,
                    // * Function for simulation, not actual app logic function
                    GestureDetector(
                      onLongPress: () {
                        context.read<OrderDetailsCubit>().onNextStatus(
                            onOrderUpdated:
                                context.read<OrdersCubit>().fetchNew);
                      },
                      child: Text(
                        order.status.toString(),
                        style: FTextStyles.body.copyWith(color: color),
                      ),
                    )
                  ],
                );
              })
            ],
          ),
          const Divider(),
          ...List.generate(
            foods.length,
            (index) => Column(
              children: [
                gapH8,
                OrderDetailsCard(
                  quantity: order.cart.items[foods[index].id]!,
                  food: foods[index],
                  status: order.status,
                ),
                gapH8,
                const Divider(),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subtotal',
                    style: FTextStyles.body,
                  ),
                  Text(
                    '\$ ${order.subTotal}',
                    style: FTextStyles.body,
                  )
                ],
              ),
              gapH4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discount',
                    style: FTextStyles.body,
                  ),
                  Text(
                    '\$ ${order.discount}',
                    style: FTextStyles.body,
                  )
                ],
              ),
              gapH4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delivery Fee',
                    style: FTextStyles.body,
                  ),
                  order.deliveryCharge == 0.0
                      ? Text(
                          'Free',
                          style:
                              FTextStyles.body.copyWith(color: FColors.green),
                        )
                      : Text(
                          '\$ ${order.deliveryCharge}',
                          style: FTextStyles.body,
                        )
                ],
              ),
              gapH12,
              const Divider(),
              gapH12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: FTextStyles.heading3.copyWith(
                      color: FColors.green,
                    ),
                  ),
                  Text(
                    '\$ ${order.paid}',
                    style: FTextStyles.heading3.copyWith(
                      color: FColors.green,
                    ),
                  ),
                ],
              ),
              gapH12,
            ],
          )
        ],
      ),
    );
  }
}
