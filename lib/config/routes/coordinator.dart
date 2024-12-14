import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../modules/cart/cart_screen.dart';
import '../../modules/chat/chat_detail/chat_detail_screen.dart';
import '../../modules/checkout/checkout_screen.dart';
import '../../modules/food/food_screen.dart';
import '../../modules/forgot_password/email_sent_screen.dart';
import '../../modules/forgot_password/forgot_password_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/home/screens/foods_screen.dart';
import '../../modules/home/screens/restaurants_screen.dart';
import '../../modules/login/cubit/login_cubit.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/order/model/order.dart';
import '../../modules/order/order_details/order_details_screen.dart';
import '../../modules/order/orders_screen.dart';
import '../../modules/profile/edit_screen.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/rating/write_review_screen.dart';
import '../../modules/restaurant/restaurant_screen.dart';
import '../../modules/search/search_screen.dart';
import '../../modules/signup/screens/fill_bio_screen.dart';
import '../../modules/signup/screens/map_screen/map_screen.dart';
import '../../modules/signup/screens/set_location_screen.dart';
import '../../modules/signup/screens/upload_photo_screen.dart';
import '../../modules/signup/screens/verification_screen.dart';
import '../../modules/signup/sign_up_screen.dart';
import '../../modules/tracking/order_tracking_screen.dart';
import '../../modules/voucher/voucher_screen.dart';
import '../../repositories/domain_manager.dart';
import '../../repositories/food/food_model.dart';
import '../../repositories/restaurants/restaurant_model.dart';
import '../../repositories/users/coordinate.dart';
import '../../repositories/users/user_model.dart';
import '../../utils/helpers/resfresh_stream.dart';
import '../../utils/services/shared_preferences.dart';
import '../../utils/ui/scaffold_with_bottom_nav_bar.dart';
import '../../widgets/congrats_screen.dart';
import '../../widgets/successful_screen.dart';
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
  search,
  map,
  forgotPassword,
  resetPasswordEmailSent,
  foods,
  restaurants,
  checkout,
  voucher,
  orders,
  orderDetails,
  orderTracking,
  review,
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

  static void pushNamed(
    String route, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
  }) {
    return context.pushNamed(route, extra: extra, params: params);
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

  static void showCongratsScreen([CongratsParams? params]) {
    context.goNamed(
      Routes.congrats.name,
      extra: params ??
          CongratsParams(
            onPressed: () {
              FCoordinator.showHomeScreen();
            },
          ),
    );
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

  static void showPaymentSuccessfulScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessfulScreen(),
        ));
  }

  static void showMapScreen(
    double latitude,
    double longitude, {
    bool isSignUp = false,
  }) {
    FCoordinator.pushNamed(
      Routes.map.name,
      params: {
        'lat': latitude.toStringAsFixed(15),
        'lon': longitude.toStringAsFixed(15),
      },
      extra: isSignUp,
    );
  }
}

final appRouter = GoRouter(
  navigatorKey: FCoordinator.navigatorKey,
  initialLocation: '/logIn',
  debugLogDiagnostics: true,
  refreshListenable: UserRefreshStream(GetIt.I<LoginCubit>()),
  redirect: (context, state) {
    final isLoggedIn = DomainManager().authRepository.currentUser != null;
    if (isLoggedIn) {
      if (state.location.contains(RegExp(r'\/(onboarding|logIn|signUp)'))) {
        return '/';
      }
      return null;
    }

    if (state.location == '/' ||
        state.location.contains(RegExp(r'\/(profile|cart|chat)'))) {
      return '/logIn';
    }

    return null;
  },
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
          redirect: (context, state) {
            if (context.read<LoginCubit>().state.user == FUser.empty) {
              return null;
            }

            if (!context.read<LoginCubit>().state.user.isSetupComplete) {
              return '/bio';
            }
            return null;
          },
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
            GoRoute(
              path: 'restaurants',
              name: Routes.restaurants.name,
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (_, __) => const RestaurantsScreen(),
            ),
            GoRoute(
              path: 'foods',
              name: Routes.foods.name,
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (_, __) => const FoodsScreen(),
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
          routes: [
            GoRoute(
              name: Routes.checkout.name,
              path: 'checkout',
              parentNavigatorKey: FCoordinator.navigatorKey,
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: CheckoutScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/orders',
          name: Routes.orders.name,
          pageBuilder: (_, __) => const NoTransitionPage(
            child: OrdersScreen(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: FCoordinator.navigatorKey,
              path: 'details',
              name: Routes.orderDetails.name,
              builder: (_, state) => OrderDetailsScreen(
                order: state.extra as FOrder,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.chat.name,
      path: '/chat:chatId&:chatWithUserId',
      parentNavigatorKey: FCoordinator.navigatorKey,
      builder: (_, state) => ChatDetailScreen(
        chatId: state.params['chatId']!,
        chatWithUserId: state.params['chatWithUserId']!,
      ),
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
      routes: [
        GoRoute(
          name: Routes.forgotPassword.name,
          path: 'forgot',
          builder: (_, __) => const ForgotPasswordScreen(),
          routes: [
            GoRoute(
              name: Routes.resetPasswordEmailSent.name,
              path: 'sent',
              builder: (_, __) => const EmailSentScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.congrats.name,
      path: '/congrats',
      builder: (_, state) => CongratsScreen(
        params: state.extra as CongratsParams,
      ),
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
    GoRoute(
      name: Routes.map.name,
      parentNavigatorKey: FCoordinator.navigatorKey,
      path: '/map:lat&:lon',
      pageBuilder: (_, state) {
        final lat = double.tryParse(state.params['lat']!);
        final lon = double.tryParse(state.params['lon']!);

        return MaterialPage(
          fullscreenDialog: true,
          child: MapScreen(
            lat: lat ?? 10.7548026,
            lon: lon ?? 106.4109718,
            isSigningUp: (state.extra as bool?) ?? false,
          ),
        );
      },
    ),
    GoRoute(
      name: Routes.voucher.name,
      path: '/voucher',
      parentNavigatorKey: FCoordinator.navigatorKey,
      pageBuilder: (_, __) => const MaterialPage(
        fullscreenDialog: true,
        child: VoucherScreen(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: FCoordinator.navigatorKey,
      name: Routes.orderTracking.name,
      path: '/tracking',
      pageBuilder: (_, state) {
        final params = state.extra as List<Coordinate>;
        return MaterialPage(
          fullscreenDialog: true,
          child: OrderTrackingScreen(
            source: params[0],
            destination: params[1],
          ),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: FCoordinator.navigatorKey,
      name: Routes.review.name,
      path: '/review',
      pageBuilder: (context, state) => MaterialPage(
        fullscreenDialog: true,
        child: WriteReviewScreen(food: state.extra as FFood),
      ),
    ),
  ],
);
