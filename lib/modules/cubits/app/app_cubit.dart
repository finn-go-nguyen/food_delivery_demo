import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_delivery/repositories/notification/notification_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../base/cubit.dart';
import '../../../base/state.dart';
import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/cloud_storage/cloud_storage.dart';
import '../../../repositories/restaurants/restaurant_model.dart';
import '../../../repositories/users/user_model.dart';
import '../../../repositories/users/user_repository.dart';
import '../../../utils/services/notification_service.dart';
import '../../home/cubit/home_cubit.dart';
import '../../login/cubit/login_cubit.dart';
import '../../order/model/order.dart';
import '../../signup/cubit/sign_up_cubit.dart';

part 'app_state.dart';

class AppCubit extends FCubit<AppState> {
  AppCubit({
    required CloudStorage cloudStorage,
    required UserRepository userRepository,
    required AuthRepository authRepository,
    required NotificationRepository notificationRepository,
  })  : _cloudStorage = cloudStorage,
        _userRepository = userRepository,
        _authRepository = authRepository,
        super(const AppState()) {
    _notificationSubscription = FirebaseMessaging.onMessage.listen((message) {
      showFlutterNotification(message);
    });
  }

  final CloudStorage _cloudStorage;
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  late final StreamSubscription _notificationSubscription;

  void init(FUser user) async {
    emitValue(state.copyWith(user: user));
    if (user.coordinates.isEmpty) return;
    GetIt.I<HomeCubit>().init(
        user.coordinates.first.latitude, user.coordinates.first.longitude);
  }

  Future<void> signOut() async {
    emitLoading();
    await _authRepository.signOut();
    emit(const AppState());
    GetIt.I<SignUpCubit>().emit(const SignUpState());
    GetIt.I<LoginCubit>().emit(
      GetIt.I<LoginCubit>().state.copyWith(user: FUser.empty),
    );
  }

  void updateUserState(FUser user) {
    emitValue(state.copyWith(user: user));
    _userRepository.set(user);
    GetIt.I<HomeCubit>().init(
      user.coordinates.first.latitude,
      user.coordinates.first.longitude,
    );
  }

  Future<void> updateUserToDatabase([String? imgUrl]) async {
    emitLoading();
    FUser? update;

    if (imgUrl != null) {
      update = state.user!.copyWith(
        photo: await _cloudStorage.uploadAvatar(state.user!.id, imgUrl),
      );
    }
    final result = await _userRepository.set(update ?? state.user!);

    if (result.isError) {
      emitError(result.error!);
      return;
    }

    emitValue(state.copyWith(user: result.data!));
  }

  void deleteUserFromDatabase() {
    _authRepository.deleteUser().then((value) {
      if (value.isError) {
        emitError(value.error!);
        return;
      }
      signOut();
    });
    if (!state.status.hasError) {
      _userRepository.delete(state.user!.id);
    }
  }

  void changePassword(String currentPassword, String newPassword) async {
    emitLoading();
    final result =
        await _authRepository.changePassword(currentPassword, newPassword);

    if (result.isError) {
      emitError(result.error!);
      return;
    }

    emitValue();
  }

  FOrder onOrderDelivered() {
    return _onOrderStatusChanged(OrderStatus.delivered);
  }

  void onOrderCanceled() {
    _onOrderStatusChanged(OrderStatus.cancelled);
  }

  FOrder _onOrderStatusChanged(OrderStatus status) {
    final update = state.order!.copyWith(status: status);
    emitValue(
      state.copyWith(
        order: update,
      ),
    );
    return update;
  }

  @override
  Future<void> close() {
    _notificationSubscription.cancel();
    return super.close();
  }
}
