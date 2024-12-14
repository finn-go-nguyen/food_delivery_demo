import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_delivery/repositories/result.dart';

class NotificationRepository {
  NotificationRepository(
    this._messaging,
    this._firestore,
  );

  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;

  Future<FResult<String>> getToken() async {
    try {
      final token = await _messaging.getToken();
      return FResult.success(token!);
    } catch (e) {
      return FResult.exception(e);
    }
  }

  Future<FResult<String>> saveToken(String uid, String token) async {
    try {
      await _firestore
          .collection('notification_tokens')
          .doc(uid)
          .set({'token': token});
      return FResult.success('');
    } catch (e) {
      return FResult.exception(e);
    }
  }
}
