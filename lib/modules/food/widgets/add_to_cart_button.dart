import 'package:flutter/material.dart';

import '../../../config/routes/coordinator.dart';
import '../../../constants/ui/ui.dart';
import '../../../widgets/buttons/gradient_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.isAdded,
    this.isLoading = false,
    this.onPressed,
  });

  final bool isAdded;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GradientButton(
        onPressed:
            isAdded ? () => FCoordinator.goNamed(Routes.cart.name) : onPressed,
        height: 70.0,
        width: double.infinity,
        gradient: FColors.linearGradient,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                isAdded ? 'Go To Cart' : 'Add To Cart',
                style: FTextStyles.button.copyWith(fontSize: 18.0),
              ),
      ),
    );
  }
}
