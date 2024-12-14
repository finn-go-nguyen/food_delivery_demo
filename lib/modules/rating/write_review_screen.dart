import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/config/routes/coordinator.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/modules/cubits/app/app_cubit.dart';
import 'package:food_delivery/utils/ui/network_image.dart';
import 'package:food_delivery/utils/ui/snack_bar.dart';
import 'package:food_delivery/widgets/buttons/gradient_button.dart';
import 'package:get_it/get_it.dart';

import '../../gen/assets.gen.dart';
import '../../repositories/food/food_model.dart';
import '../../utils/ui/scaffold.dart';
import 'cubit/rating_cubit.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({
    super.key,
    required this.food,
  });

  final FFood food;

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  late final _cubit = GetIt.I<RatingCubit>();
  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => GetIt.I<RatingCubit>(),
      child: Builder(builder: (context) {
        return FScaffold(
          centerBottomButton: Container(
            padding: Ui.screenPaddingHorizontal,
            width: double.infinity,
            child: GradientButton(
              onPressed: () => context.read<RatingCubit>().submit(
                context.read<AppCubit>().state.user!.id,
                widget.food.id,
                widget.food.restaurantId,
                onReviewAddSuccessfully: () {
                  FSnackBar.showSnackBar('Review Added', FColors.green);
                  Navigator.pop(context);
                },
              ),
              child: const Text(
                'Submit Review',
                style: FTextStyles.button,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: Ui.screenPadding,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: Ui.borderRadius,
                      child: SizedBox.square(
                        dimension: 70,
                        child: FNetworkImage(widget.food.img),
                      ),
                    ),
                    gapW16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: FTextStyles.heading4,
                          ),
                          Text(
                            widget.food.description,
                          ),
                        ],
                      ),
                    ),
                    gapW8,
                    const IconButton(
                      onPressed: FCoordinator.onBack,
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              gapH4,
              const Divider(),
              gapH4,
              Padding(
                padding: Ui.screenPaddingHorizontal,
                child: Column(
                  children: [
                    const Text(
                      'Write your Review',
                      style: FTextStyles.heading4,
                    ),
                    gapH12,
                    RatingBar.builder(
                      initialRating: 5,
                      unratedColor: FColors.loading,
                      glow: false,
                      itemBuilder: (_, __) =>
                          Image.asset(Assets.icons.starFull.path),
                      itemSize: 35.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: context.read<RatingCubit>().onStarChanged,
                    ),
                    gapH16,
                    Theme(
                      data: ThemeData(
                        inputDecorationTheme: const InputDecorationTheme(
                          border: OutlineInputBorder(
                            borderRadius: Ui.borderRadius,
                            borderSide: BorderSide(
                              color: FColors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: Ui.borderRadius,
                            borderSide: BorderSide(
                              color: FColors.green,
                            ),
                          ),
                        ),
                      ),
                      child: TextField(
                        onChanged: context.read<RatingCubit>().onReviewChanged,
                        decoration: const InputDecoration(
                            hintText:
                                'Would you like to write anything about this product?'),
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
