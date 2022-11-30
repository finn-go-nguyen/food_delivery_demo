import 'package:flutter/material.dart';
import 'package:food_delivery/constants/ui/colors.dart';
import 'package:food_delivery/constants/ui/ui_parameters.dart';

import '../../constants/ui/text_style.dart';
import '../../utils/ui/drop_shadow.dart';

class FOutlinedIconButton extends StatelessWidget {
  const FOutlinedIconButton({
    super.key,
    required this.label,
    required this.iconPath,
    this.onPressed,
    this.minHeight = 57.0,
    this.minWidth = 152.0,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
    this.style = FTextStyles.buttonBlack,
    this.color,
  });

  final String label;
  final String iconPath;
  final VoidCallback? onPressed;
  final double minWidth;
  final double minHeight;
  final double maxWidth;
  final double maxHeight;
  final TextStyle style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      ),
      child: DropShadow(
        color: color,
        child: InkWell(
          highlightColor: FColors.lightGreen,
          onTap: onPressed,
          borderRadius: Ui.borderRadius,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox.square(
                dimension: 26.0,
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                label,
                style: style,
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
