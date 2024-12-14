import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/routes/coordinator.dart';
import '../../../constants/constants.dart';
import '../../../gen/assets.gen.dart';
import '../cubit/orders_cubit.dart';
import '../../../repositories/users/coordinate.dart';
import '../../../widgets/dialogs/dialog.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/helpers/text_helpers.dart';
import '../../../utils/ui/scaffold.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/buttons/gradient_button.dart';
import '../model/order.dart';
import 'cubit/order_details_cubit.dart';
import 'widgets/order_details_view.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final FOrder order;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late final _cubit = GetIt.I<OrderDetailsCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init(widget.order);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        buildWhen: (previous, current) => current.maybeWhen(
          loadSuccess: (_, __, ___) => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return FScaffold(
            bottomNavigationBar:
                state.whenOrNull(loadSuccess: (order, _, restaurant) {
              if (order.isRunning && order.status != OrderStatus.confirmed) {
                return Container(
                  height: 50.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: order.status == OrderStatus.placed
                      ? OutlinedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => FAlertDialog(
                              title:
                                  'Are you sure you want to cancel this order?',
                              onYesPressed: () {
                                _cubit.cancelOrder(
                                  onOrderUpdated:
                                      context.read<OrdersCubit>().fetchNew,
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            'Cancel Order',
                            style: FTextStyles.button.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        )
                      : order.status == OrderStatus.onTheWay
                          ? BlocProvider.value(
                              value: _cubit,
                              child: Builder(builder: (context) {
                                return GradientButton(
                                  onPressed: () => context.pushNamed(
                                    Routes.orderTracking.name,
                                    extra: <Coordinate>[
                                      restaurant.coordinate,
                                      order.userPosition,
                                    ],
                                  ),
                                  child: const Text(
                                    'Track Order',
                                    style: FTextStyles.button,
                                  ),
                                );
                              }),
                            )
                          : const SizedBox(),
                );
              }
              return null;
            }),
            body: Column(
              children: [
                const Padding(
                  padding: Ui.screenPadding,
                  child: FAppBar(title: 'Order Details'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: Ui.screenPaddingHorizontal,
                    child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => const Center(
                            child:
                                CircularProgressIndicator(color: FColors.green),
                          ),
                          loadFailure: (message) => Center(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.cancel,
                                  size: 50,
                                ),
                                gapH20,
                                Text(
                                  message,
                                  style: FTextStyles.body
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          loadSuccess: (order, foods, restaurant) => Column(
                            children: [
                              order.isRunning
                                  ? Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 200.0,
                                            child: SvgPicture.asset(
                                              Assets.images.illustrations
                                                  .onTheWay,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          const Text(
                                              'Your food will delivered within'),
                                          Text(
                                            StringExtension.toTime(
                                                restaurant.duration!),
                                            style: FTextStyles.heading4
                                                .copyWith(color: FColors.green),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              gapH20,
                              OrderDetailsView(
                                order: order,
                                foods: foods,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
