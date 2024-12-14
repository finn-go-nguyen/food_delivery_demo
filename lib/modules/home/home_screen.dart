import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/repositories/domain_manager.dart';
import '../cubits/app/app_cubit.dart';
import '../order/cubit/orders_cubit.dart';

import '../../config/routes/coordinator.dart';
import '../../constants/ui/sizes.dart';
import '../../constants/ui/ui_parameters.dart';
import '../../utils/ui/listen_error.dart';
import '../../utils/ui/scaffold.dart';
import '../tracking/widgets/current_order_card.dart';
import 'cubit/home_cubit.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    DomainManager().notificationRepository.getToken().then(
          (value) => DomainManager().notificationRepository.saveToken(
              DomainManager().authRepository.currentUser!.id, value.data!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listenWhen: (_, current) => current.user != null,
      listener: (context, state) {
        context.read<OrdersCubit>().fetchNew();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: ListenError<HomeCubit>(
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                FScaffold(
                  body: Column(
                    children: [
                      Padding(
                        padding: Ui.screenPadding,
                        child: HomeAppBar(
                          onSearchBarPressed: () =>
                              FCoordinator.goNamed(Routes.search.name),
                        ),
                      ),
                      gapH16,
                      const Expanded(
                        child: HomeBody(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    15.0,
                    0.0,
                    15.0,
                    Sizes.navBarGapH.height!,
                  ),
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    buildWhen: (previous, current) =>
                        previous.runningOrders != current.runningOrders,
                    builder: (context, state) {
                      if (state.status.isLoading ||
                          state.runningOrders.isEmpty) {
                        return const SizedBox();
                      }

                      final trackedOrder = state.runningOrders.first;

                      return CurrentOrderCard(
                        chatId: trackedOrder.id!,
                        shipper: state.shipper!,
                        order: trackedOrder,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
