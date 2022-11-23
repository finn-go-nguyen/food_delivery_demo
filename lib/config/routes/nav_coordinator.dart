import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class NavCoordinator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;
  String get initialRoute;
  NavigatorObserver? get navigatorObserver;

  Route<dynamic>? onGenerateRoute(RouteSettings settings);

  void onExit(BuildContext context) {}

  void onBack([Object? result]) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  Navigator getNavigator({String? initialRoute}) => Navigator(
        observers: [if (navigatorObserver != null) navigatorObserver!],
        key: navigatorKey,
        initialRoute: initialRoute ?? this.initialRoute,
        onGenerateRoute: onGenerateRoute,
      );

  Future? pushNamed(String route, {Map? arguments}) {
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  Future? push(Route route) {
    return navigatorKey.currentState!.push(route);
  }
}
