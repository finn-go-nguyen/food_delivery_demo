import 'package:flutter/material.dart';

import '../../constants/ui/colors.dart';
import '../../constants/ui/ui_parameters.dart';

class FIconRounded extends StatelessWidget {
  const FIconRounded({
    super.key,
    this.hasNotification = false,
    required this.icon,
    this.onPressed,
  });

  final bool hasNotification;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        borderRadius: Ui.borderRadius,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(5, 5),
            color: FColors.shadowColor,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: Ui.borderRadius,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: icon,
                ),
                hasNotification
                    ? Positioned(
                        top: 2,
                        right: 4,
                        child: Container(
                          height: 9,
                          width: 9,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.all(1.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FIconButton extends StatelessWidget {
  const FIconButton({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final Widget icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox.square(
            dimension: 25.0,
            child: icon,
          ),
        ),
      ),
    );
  }
}
