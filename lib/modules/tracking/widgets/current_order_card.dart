import 'package:flutter/material.dart';
import '../../order/model/order.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../config/routes/coordinator.dart';
import '../../../constants/ui/colors.dart';
import '../../../constants/ui/sizes.dart';
import '../../../constants/ui/text_style.dart';
import '../../../constants/ui/ui_parameters.dart';
import '../../../repositories/users/user_model.dart';
import '../../../utils/ui/card.dart';
import '../../../utils/ui/network_image.dart';
import '../../../widgets/buttons/icon_button.dart';

class CurrentOrderCard extends StatelessWidget {
  const CurrentOrderCard({
    super.key,
    required this.chatId,
    required this.shipper,
    required this.order,
  });

  final String chatId;
  final FUser shipper;
  final FOrder order;

  @override
  Widget build(BuildContext context) {
    return FCard(
      onTap: () => FCoordinator.pushNamed(
        Routes.orderDetails.name,
        extra: order,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: Ui.borderRadius,
            child: SizedBox.square(
              dimension: 60.0,
              child: FNetworkImage(
                shipper.photo!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          gapW12,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Order status',
                  style: FTextStyles.heading5,
                ),
                Text(
                  order.status.toString(),
                  style: FTextStyles.heading4.copyWith(
                    color: FColors.metallicOrange,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              FIconRounded(
                onPressed: () {
                  FCoordinator.pushNamed(
                    Routes.chat.name,
                    params: {
                      'chatId': chatId,
                      'chatWithUserId': shipper.id,
                    },
                  );
                },
                icon: const Icon(
                  Icons.message_outlined,
                  color: FColors.green,
                ),
              ),
              gapW4,
              FIconRounded(
                onPressed: () => launchUrlString('tel://${shipper.phone!}'),
                icon: const Icon(
                  Icons.call_outlined,
                  color: FColors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
