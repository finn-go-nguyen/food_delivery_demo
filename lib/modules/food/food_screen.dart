import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/dialogs/dialog.dart';
import 'package:get_it/get_it.dart';

import '../../constants/app_constants.dart';
import '../../constants/ui/colors.dart';
import '../../constants/ui/sizes.dart';
import '../../constants/ui/text_style.dart';
import '../../gen/assets.gen.dart';
import '../../repositories/food/food_model.dart';
import '../../utils/helpers/text_helpers.dart';
import '../../utils/ui/network_image.dart';
import '../../utils/ui/scrollable_screen_with_background.dart';
import '../../widgets/buttons/icon_button.dart';
import '../../widgets/chips/category_chip.dart';
import '../../widgets/testimonial_section.dart';
import '../cart/cubit/cart_cubit.dart';
import '../cubits/favorite/favorite_cubit.dart';
import 'cubit/food_cubit.dart';
import 'widgets/add_to_cart_button.dart';
import 'widgets/food_rating.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({
    super.key,
    required this.food,
  });

  final FFood food;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late final FoodCubit _foodCubit = GetIt.I<FoodCubit>();

  @override
  void initState() {
    super.initState();
    _foodCubit.init(widget.food);
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => _foodCubit,
      child: BlocBuilder<FoodCubit, FoodState>(
        buildWhen: (previous, current) => previous.food != current.food,
        builder: (_, state) {
          return state.food.when(
            error: (message, _) => Text(message),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            empty: (_) => const SizedBox(),
            data: (food) => ScrollableScreenWithBackground(
              backgroundImage: FNetworkImage(food.img),
              bottomCenterButton: BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) => previous.cart != current.cart,
                builder: (context, cartState) {
                  return AddToCartButton(
                    onPressed: () async {
                      if (cartState.cart.items.isEmpty ||
                          cartState.cart.restaurantId == food.restaurantId) {
                        context.read<CartCubit>().addToCart(food);
                        return;
                      }

                      showDialog(
                        context: context,
                        builder: (context) => FAlertDialog(
                          title: 'Are you sure want to reset?',
                          description:
                              'You have food from another restaurant in cart. '
                              'If you continue, your all previous food from art'
                              ' will be removed.',
                          onYesPressed: () {
                            context.read<CartCubit>().clear();
                            context.read<CartCubit>().addToCart(food);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    isAdded: cartState.cart.items.containsKey(food.id),
                  );
                },
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CategoryChip(
                                text: food.category.foodCategoryProcessor()),
                            const Spacer(),
                            FIconButton(
                              onTap: () {},
                              icon: Image.asset(
                                Assets.icons.locationPin.path,
                                fit: BoxFit.contain,
                              ),
                              color: FColors.lightGreen.withOpacity(.2),
                            ),
                            gapW8,
                            BlocBuilder<FavoriteCubit, FavoriteState>(
                              buildWhen: (previous, current) =>
                                  previous.favoriteList != current.favoriteList,
                              builder: (context, favoriteState) {
                                if (favoriteState.favoriteList == null) {
                                  return FIconButton(
                                    icon: const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.red,
                                    ),
                                    color: Colors.red.withOpacity(.1),
                                  );
                                }
                                return FIconButton(
                                  onTap: () => context
                                      .read<FavoriteCubit>()
                                      .toggleFavoriteList(food),
                                  icon: Icon(
                                    favoriteState.favoriteList!.foodIds
                                            .contains(widget.food.id)
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: Colors.red,
                                  ),
                                  color: Colors.red.withOpacity(.1),
                                );
                              },
                            )
                          ],
                        ),
                        gapH20,
                        Text(
                          food.name,
                          style: FTextStyles.heading1,
                        ),
                        gapH20,
                        FoodRating(
                          rating: state.star.maybeWhen(
                              data: (star) => star.average, orElse: () => 0.0),
                        ),
                        gapH20,
                        const Text(
                          foodDescription,
                          style: FTextStyles.description,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Ratings and Reviews',
                      style: FTextStyles.heading4,
                    ),
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                    buildWhen: (previous, current) =>
                        previous.star != current.star,
                    builder: (context, state) => state.star.when(
                      error: (message, _) => Text(message),
                      loading: (_) => const CircularProgressIndicator(),
                      empty: (_) => const Text('Empty'),
                      data: (star) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: RatingStatisticalSection(
                          star: star,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: BlocBuilder<FoodCubit, FoodState>(
                      buildWhen: (previous, current) =>
                          previous.ratings != current.ratings,
                      builder: (context, state) {
                        return state.ratings.when(
                          loading: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          error: (message, _) => Center(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.cancel,
                                  size: 50,
                                ),
                                Text(
                                  message,
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          empty: (_) => SizedBox.square(
                            dimension: 200.0,
                            child: SvgPicture.asset(
                              Assets.images.illustrations.empty,
                            ),
                          ),
                          data: (ratings) =>
                              TestimonialSection(ratings: ratings),
                        );
                      },
                    ),
                  ),
                  Sizes.navBarGapH,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
