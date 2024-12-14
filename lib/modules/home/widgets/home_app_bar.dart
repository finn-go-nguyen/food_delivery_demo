import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/food/food_model.dart';
import '../../../repositories/restaurants/restaurant_model.dart';

import '../../../constants/ui/colors.dart';
import '../../../constants/ui/sizes.dart';
import '../../../constants/ui/text_style.dart';
import '../../../constants/ui/ui_parameters.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/buttons/icon_button.dart';
import '../../search/cubit/search_cubit.dart';
import '../../search/widgets/filter_chip.dart';
import 'home_search_bar.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    this.onSearchBarPressed,
    this.searchController,
  });

  final VoidCallback? onSearchBarPressed;
  final TextEditingController? searchController;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Find Your Favorite Food',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    FTextStyles.heading1.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            Flexible(
              child: FIconRounded(
                onPressed: () async {
                  final resRef = FirebaseFirestore.instance
                      .collection('restaurants')
                      .withConverter(
                        fromFirestore: (snapshot, options) =>
                            FRestaurant.fromMap(snapshot.data()!),
                        toFirestore: (value, options) => value.toMap(),
                      );
                  final foodRef = FirebaseFirestore.instance
                      .collection('foods')
                      .withConverter(
                        fromFirestore: (snapshot, options) =>
                            FFood.fromMap(snapshot.data()!),
                        toFirestore: (value, options) => value.toMap(),
                      );

                  final restaurantsQuery = await resRef.get();
                  final restaurants =
                      restaurantsQuery.docs.map((e) => e.data());

                  for (var restaurant in restaurants) {
                    final resId = restaurant.id;
                    for (var foodId in restaurant.foodIds) {
                      foodRef.doc(foodId).update({'restaurantId': resId});
                    }
                  }
                },
                hasNotification: true,
                icon: Image.asset(
                  Assets.icons.notifiaction.path,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        gapH16,
        GestureDetector(
          onTap: widget.onSearchBarPressed,
          child: HomeSearchBar(
            enable: widget.onSearchBarPressed == null,
            searchController: widget.searchController,
            onFilterPressed: () => _onFilterButtonPressed(context),
          ),
        ),
      ],
    );
  }

  void _onFilterButtonPressed(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: Ui.screenPadding,
          child: BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) =>
                previous.filters != current.filters,
            builder: (context, state) {
              return FilterBuilder(
                filters: state.filters,
                onFilterToggled: context.read<SearchCubit>().onFilterToggled,
              );
            },
          ),
        );
      },
    );
  }
}

class FilterBuilder extends StatelessWidget {
  const FilterBuilder({
    super.key,
    required this.filters,
    this.onFilterToggled,
  });

  final List<SelectableItem> filters;
  final void Function(SelectableItem filter)? onFilterToggled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: FTextStyles.heading4,
          ),
          gapH8,
          Wrap(
            spacing: 10.0,
            children: filters
                .map(
                  (item) => FFilterChip(
                    label: Text(
                      item.value,
                      style: FTextStyles.label.copyWith(
                        color: FColors.metallicOrange,
                      ),
                    ),
                    selected: item.isSelected,
                    onSelected: (_) {
                      onFilterToggled?.call(item);
                    },
                  ),
                )
                .toList(),
          ),
          Sizes.navBarGapH,
        ],
      ),
    );
  }
}
