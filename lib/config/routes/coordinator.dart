import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../modules/cart/cart_screen.dart';
import '../../modules/chat/chat_detail/chat_detail_screen.dart';
import '../../modules/chat/chat_screen.dart';
import '../../modules/food/food_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/profile/edit_screen.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/restaurant/restaurant_screen.dart';
import '../../modules/search/search_screen.dart';
import '../../modules/signup/screens/fill_bio_screen.dart';
import '../../modules/signup/screens/fill_payment_screen.dart';
import '../../modules/signup/screens/set_location_screen.dart';
import '../../modules/signup/screens/upload_photo_screen.dart';
import '../../modules/signup/screens/verification_screen.dart';
import '../../modules/signup/sign_up_screen.dart';
import '../../repositories/domain_manager.dart';
import '../../repositories/food/food_model.dart';
import '../../repositories/restaurants/restaurant_model.dart';
import '../../utils/services/shared_preferences.dart';
import '../../utils/ui/scaffold_with_bottom_nav_bar.dart';
import '../../widgets/congrats_screen.dart';
import 'route_observer.dart';

enum Routes {
  onboarding,
  home,
  logIn,
  signUp,
  bio,
  verification,
  payment,
  uploadPhoto,
  setLocation,
  congrats,
  profile,
  cart,
  chat,
  editProfile,
  food,
  restaurant,
  chatDetail,
  search,
}

class FCoordinator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState!.context;

  static String get location => GoRouter.of(context).location;

  static NavigatorObserver navigatorObserver = AppRouteObserver();

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void onBack([Object? result]) {
    if (canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  static void pushNamed(String route, {Object? extra}) {
    return context.pushNamed(route, extra: extra);
  }

  static Future? push(Route route) {
    return navigatorKey.currentState!.push(route);
  }

  static void goNamed(
    String route, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
  }) {
    return context.goNamed(route, extra: extra, params: params);
  }

  static void showOnboardingScreen() {
    context.goNamed(Routes.onboarding.name);
  }

  static void showHomeScreen() {
    context.goNamed(Routes.home.name);
  }

  static void showLoginScreen() {
    context.goNamed(Routes.logIn.name);
  }

  static void showSignUpScreen() {
    context.goNamed(Routes.signUp.name);
  }

  static void showBioScreen() {
    context.goNamed(Routes.bio.name);
  }

  static void showVerificationScreen() {
    context.pushNamed(
      Routes.verification.name,
    );
  }

  static void showPaymentScreen() {
    context.pushNamed(Routes.payment.name);
  }

  static void showUploadPhotoScreen() {
    context.pushNamed(Routes.uploadPhoto.name);
  }

  static void showSetLocationScreen() {
    context.pushNamed(Routes.setLocation.name);
  }

  static void showCongratsScreen() {
    context.goNamed(Routes.congrats.name);
  }

  static void showEditProfileScreen() {
    context.pushNamed(Routes.editProfile.name);
  }

  static void showFoodScreen(FFood food) {
    context.goNamed(Routes.food.name, extra: food);
  }

  static void showRestaurantScreen(FRestaurant restaurant) {
    context.goNamed(Routes.restaurant.name, extra: restaurant);
  }
}

final appRouter = GoRouter(
  navigatorKey: FCoordinator.navigatorKey,
  initialLocation: '/logIn',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: Routes.onboarding.name,
      path: '/onboarding',
      builder: (_, __) => const OnboardingScreen(),
    ),
    ShellRoute(
      navigatorKey: FCoordinator._shellNavigatorKey,
      builder: (_, state, child) {
        return ScaffoldWithBottomNavBar(
          location: state.location,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: Routes.home.name,
          pageBuilder: (_, __) => const NoTransitionPage(
            child: HomeScreen(),
          ),
          routes: [
            GoRoute(
              path: 'restaurant',
              name: Routes.restaurant.name,
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (_, state) => RestaurantScreen(
                restaurant: state.extra as FRestaurant,
              ),
            ),
            GoRoute(
              path: 'food',
              name: Routes.food.name,
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (_, state) => FoodScreen(
                food: state.extra as FFood,
              ),
            ),
            GoRoute(
              path: 'search',
              name: Routes.search.name,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: SearchScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          name: Routes.profile.name,
          pageBuilder: (_, __) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
          routes: [
            GoRoute(
              path: 'editProfile',
              name: Routes.editProfile.name,
              parentNavigatorKey: FCoordinator.navigatorKey,
              pageBuilder: (_, __) => const MaterialPage(
                fullscreenDialog: true,
                child: EditProfileScreen(),
              ),
            )
          ],
        ),
        GoRoute(
          name: Routes.cart.name,
          path: '/cart',
          pageBuilder: (_, __) => const NoTransitionPage(
            child: CartScreen(),
          ),
        ),
        GoRoute(
          name: Routes.chat.name,
          path: '/chat',
          pageBuilder: (_, __) => const NoTransitionPage(
            child: ChatScreen(),
          ),
          routes: [
            GoRoute(
              name: Routes.chatDetail.name,
              path: 'detail:chatId&:chatWithUserId',
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (_, state) => ChatDetailScreen(
                chatId: state.params['chatId']!,
                chatWithUserId: state.params['chatWithUserId']!,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.logIn.name,
      path: '/logIn',
      builder: (_, __) => const LoginScreen(),
      redirect: (context, state) async {
        if (DomainManager().authRepository.currentUser != null) {
          return '/';
        }
        final sharedPreferences = GetIt.I<FSharedPreferences>();
        if (!sharedPreferences.wasOnboardingShown) {
          return '/onboarding';
        }
        return null;
      },
    ),
    GoRoute(
      name: Routes.congrats.name,
      path: '/congrats',
      builder: (_, __) => const CongratsScreen(),
    ),
    GoRoute(
      name: Routes.signUp.name,
      path: '/signUp',
      builder: (_, __) => const SignUpScreen(),
    ),
    GoRoute(
      name: Routes.bio.name,
      path: '/bio',
      builder: (_, __) => const FillBioScreen(),
      routes: [
        GoRoute(
          name: Routes.verification.name,
          path: 'verification',
          builder: (_, state) => const VerificationScreen(),
        ),
        GoRoute(
          name: Routes.payment.name,
          path: 'payment',
          builder: (_, __) => const FillPaymentScreen(),
        ),
        GoRoute(
          name: Routes.uploadPhoto.name,
          path: 'uploadPhoto',
          builder: (_, __) => const UploadPhotoScreen(),
        ),
        GoRoute(
          name: Routes.setLocation.name,
          path: 'setLocation',
          builder: (_, __) => const SetLocationScreen(),
        ),
      ],
    ),
  ],
);
