import 'package:dart_geohash/dart_geohash.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'config/secrets.dart';
import 'modules/cart/cubit/cart_cubit.dart';
import 'modules/chat/chat_detail/cubit/chat_detail_cubit.dart';
import 'modules/chat/cubit/chat_cubit.dart';
import 'modules/checkout/cubit/payment_cubit.dart';
import 'modules/cubits/app/app_cubit.dart';
import 'modules/cubits/favorite/favorite_cubit.dart';
import 'modules/food/cubit/food_cubit.dart';
import 'modules/forgot_password/cubit/forgot_password_cubit.dart';
import 'modules/home/cubit/home_cubit.dart';
import 'modules/home/screens/cubit/view_more_cubit.dart';
import 'modules/login/cubit/login_cubit.dart';
import 'modules/order/cubit/orders_cubit.dart';
import 'modules/order/data/order_repository.dart';
import 'modules/order/order_details/cubit/order_details_cubit.dart';
import 'modules/restaurant/cubit/restaurant_cubit.dart';
import 'modules/search/cubit/search_cubit.dart';
import 'modules/signup/cubit/sign_up_cubit.dart';
import 'modules/signup/screens/map_screen/cubit/map_screen_cubit.dart';
import 'modules/tracking/cubit/order_tracking_cubit.dart';
import 'repositories/domain_manager.dart';
import 'repositories/payment/payment_repostiory.dart';
import 'repositories/users/coordinate.dart';
import 'utils/services/notification_service.dart';
import 'utils/services/shared_preferences.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Fi
  print('Handling a background message ${message.messageId}');
}

Future<void> initializeApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Stripe.publishableKey = Credentials.stripePublishableKey;
  // Remove '#' sign in url
  usePathUrlStrategy();

  await Firebase.initializeApp();

  await Future.wait(
    [
      FirebaseMessaging.instance.getInitialMessage(),
      FirebaseAppCheck.instance.activate(
        webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      ),
      Stripe.instance.applySettings(),
      // Set true to disable verification for testing
      FirebaseAuth.instance
          .setSettings(appVerificationDisabledForTesting: kDebugMode),
      _locator(),
    ],
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(!kDebugMode);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await setupFlutterNotifications();

  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}

Future<void> _locator() async {
  GetIt.I.registerLazySingleton(() => http.Client());

  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerLazySingleton<FSharedPreferences>(
    () => FSharedPreferences(sharedPreferences),
  );

  GetIt.I.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  GetIt.I.registerSingleton<LoginCubit>(
    dispose: (cubit) => cubit.close(),
    LoginCubit(
      authRepository: DomainManager().authRepository,
      userRepository: DomainManager().userRepository,
      sharedPreferences: GetIt.I<FSharedPreferences>(),
    )..init(),
  );

  GetIt.I.registerLazySingleton<AppCubit>(
    dispose: (cubit) => cubit.close(),
    () => AppCubit(
      userRepository: DomainManager().userRepository,
      cloudStorage: DomainManager().cloudStorage,
      authRepository: DomainManager().authRepository,
      notificationRepository: DomainManager().notificationRepository,
    ),
  );

  GetIt.I.registerLazySingleton<SignUpCubit>(
    dispose: (cubit) => cubit.close(),
    () => SignUpCubit(
      authRepository: DomainManager().authRepository,
      userRepository: DomainManager().userRepository,
      cloudStorage: DomainManager().cloudStorage,
    ),
  );

  GetIt.I.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      restaurantRepository: DomainManager().restaurantRepository,
      foodRepository: DomainManager().foodRepository,
      placesSearchRepository: DomainManager().placesSearchRepository,
    ),
  );

  GetIt.I.registerFactory<FoodCubit>(
    () => FoodCubit(
      foodRepository: DomainManager().foodRepository,
    ),
  );

  GetIt.I.registerFactory<RestaurantCubit>(
    () => RestaurantCubit(
      foodRepository: DomainManager().foodRepository,
    ),
  );

  GetIt.I.registerFactory<CartCubit>(
    () => CartCubit(
      cartRepository: DomainManager().cartRepository,
      foodRepository: DomainManager().foodRepository,
    ),
  );

  GetIt.I.registerFactory<ChatCubit>(
    () => ChatCubit(
      chatRepository: DomainManager().chatRepository,
      userRepository: DomainManager().userRepository,
    ),
  );
  GetIt.I.registerFactory<ChatDetailCubit>(
    () => ChatDetailCubit(
      chatRepository: DomainManager().chatRepository,
      messageRepository: DomainManager().messageRepository,
    ),
  );
  GetIt.I.registerFactory<SearchCubit>(
    () => SearchCubit(
      searchRepository: DomainManager().searchRepository,
    )..init(),
  );
  GetIt.I.registerFactory<MapScreenCubit>(
    () => MapScreenCubit(
      geocodingRepository: DomainManager().geocodingRepository,
      placesSearchRepository: DomainManager().placesSearchRepository,
    ),
  );
  GetIt.I.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(DomainManager().authRepository),
  );
  GetIt.I.registerFactory<ViewMoreCubit>(
    () => ViewMoreCubit(
      DomainManager().foodRepository,
      DomainManager().restaurantRepository,
      DomainManager().placesSearchRepository,
    ),
  );

  GetIt.I.registerFactory<PaymentCubit>(
    () => PaymentCubit(
      GetIt.I<PaymentRepository>(),
    ),
  );

  GetIt.I.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      uid: GetIt.I<AppCubit>().state.user!.id,
      favoriteListRepository: DomainManager().favoriteListRepository,
      foodRepository: DomainManager().foodRepository,
    ),
  );

  GetIt.I.registerFactory<OrdersCubit>(
    () => OrdersCubit(
      orderRepository: GetIt.I<OrderRepository>(),
      restaurantRepository: DomainManager().restaurantRepository,
      userRepository: DomainManager().userRepository,
    )..fetchNew(),
  );

  GetIt.I.registerFactory<OrderDetailsCubit>(
    () => OrderDetailsCubit(
      DomainManager().placesSearchRepository,
      DomainManager().restaurantRepository,
      DomainManager().foodRepository,
      GetIt.I<OrderRepository>(),
    ),
  );

  GetIt.I.registerFactoryParam<OrderTrackingCubit, Coordinate, Coordinate>(
    (Coordinate source, Coordinate destination) => OrderTrackingCubit(
      source: source,
      destination: destination,
    )..init(),
  );

  // External services
  GetIt.I.registerLazySingleton<GeoHasher>(
    () => GeoHasher(),
  );

  GetIt.I.registerLazySingleton<PolylinePoints>(
    () => PolylinePoints(),
  );

  // Payment repository
  GetIt.I.registerLazySingleton<PaymentRepository>(
    () => PaymentRepository(DomainManager().authRepository.currentUser!.id),
  );

  GetIt.I.registerLazySingleton<OrderRepository>(
    () => OrderRepository(DomainManager().authRepository.currentUser!.id),
  );
}
