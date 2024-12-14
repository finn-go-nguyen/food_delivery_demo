// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FRating _$$_FRatingFromJson(Map<String, dynamic> json) => _$_FRating(
      id: json['id'] as String?,
      rate: json['rate'] as int,
      created: DateTime.parse(json['created'] as String),
      uid: json['uid'] as String,
      foodId: json['foodId'] as String,
      restaurantId: json['restaurantId'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String?,
      name: json['name'] as String?,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$$_FRatingToJson(_$_FRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'created': instance.created.toIso8601String(),
      'uid': instance.uid,
      'foodId': instance.foodId,
      'restaurantId': instance.restaurantId,
      'userPhotoUrl': instance.userPhotoUrl,
      'name': instance.name,
      'review': instance.review,
    };
