import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_delivery/repositories/notification/notification_repository.dart';
import 'package:food_delivery/repositories/rating/rating_repository.dart';
import 'package:food_delivery/repositories/rating/star/star_count_repository.dart';
import 'package:get_it/get_it.dart';

import 'auth/auth_repository.dart';
import 'auth/firebase_auth_repository.dart';
import 'cart/cart_repository.dart';
import 'cart/cart_repository_impl.dart';
import 'chat/chat_repository.dart';
import 'chat/chat_repository_impl.dart';
import 'chat/messages/message_repository.dart';
import 'chat/messages/message_repository_impl.dart';
import 'cloud_storage/cloud_storage.dart';
import 'cloud_storage/firebase_cloud_storage.dart';
import 'favorite/favorite_list_repository.dart';
import 'favorite/favorite_list_repository_impl.dart';
import 'food/food_repository.dart';
import 'food/food_repository_impl.dart';
import 'maps/geocoding/geocoding_repository.dart';
import 'maps/geocoding/google_geocoding_repository.dart';
import 'maps/search/google_places_search_repository.dart';
import 'maps/search/places_search_repository.dart';
import 'restaurants/restaurant_repository.dart';
import 'restaurants/restaurant_repository_impl.dart';
import 'search/algolia_search_repository.dart';
import 'search/search_repository.dart';
import 'users/user_repository.dart';
import 'users/user_repository_impl.dart';

class DomainManager {
  DomainManager._() {
    authRepository = const FirebaseAuthRepository();
    userRepository = UserRepositoryImpl();
    restaurantRepository = RestaurantRepositoryImpl();
    foodRepository = FoodRepositoryImpl();
    cartRepository = CartRepositoryImpl();
    favoriteListRepository = FavoriteListRepositoryImpl();
    chatRepository = ChatRepositoryImpl();
    messageRepository = MessageRepositoryImpl();
    searchRepository = AlgoliaSearchRepository();
    cloudStorage = const FirebaseCloudStorage();
    geocodingRepository = GoogleGeocodingRepository(GetIt.I());
    placesSearchRepository = GooglePlacesSearchRepository(GetIt.I());
    notificationRepository = NotificationRepository(
      FirebaseMessaging.instance,
      FirebaseFirestore.instance,
    );
    ratingRepository = RatingRepository(
      FirebaseFirestore.instance,
    );
    starCountRepository = StarCountRepository(FirebaseFirestore.instance);
  }
  static final DomainManager _instance = DomainManager._();

  factory DomainManager() {
    return _instance;
  }

  late AuthRepository authRepository;
  late UserRepository userRepository;
  late RestaurantRepository restaurantRepository;
  late FoodRepository foodRepository;
  late CartRepository cartRepository;
  late FavoriteListRepository favoriteListRepository;
  late ChatRepository chatRepository;
  late MessageRepository messageRepository;
  late SearchRepository searchRepository;
  late CloudStorage cloudStorage;
  late GeocodingRepository geocodingRepository;
  late PlacesSearchRepository placesSearchRepository;
  late NotificationRepository notificationRepository;
  late RatingRepository ratingRepository;
  late StarCountRepository starCountRepository;
}
