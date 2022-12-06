import 'order_model.dart';

class FStripe extends FOrder {
  FStripe({
    super.id,
    required super.amount,
    this.client = 'mobile',
    this.mode = 'payment',
    this.currency = 'USD',
    this.customerId,
    this.ephemeralKeySecret,
    this.paymentIntentClientSecret,
    this.created,
  });

  final String client;
  final String mode;
  final String currency;
  final String? customerId;
  final String? ephemeralKeySecret;
  final String? paymentIntentClientSecret;
  final DateTime? created;

  @override
  FStripe copyWith({
    String? id,
    int? amount,
    String? client,
    String? mode,
    String? currency,
    String? customerId,
    String? ephemeralKeySecret,
    String? paymentIntentClientSecret,
    DateTime? created,
  }) {
    return FStripe(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      client: client ?? this.client,
      mode: mode ?? this.mode,
      currency: currency ?? this.currency,
      customerId: customerId ?? this.customerId,
      ephemeralKeySecret: ephemeralKeySecret ?? this.ephemeralKeySecret,
      paymentIntentClientSecret:
          paymentIntentClientSecret ?? this.paymentIntentClientSecret,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'client': client,
      'mode': mode,
      'currency': currency,
      'customerId': customerId,
      'ephemeralKeySecret': ephemeralKeySecret,
      'paymentIntentClientSecret': paymentIntentClientSecret,
      'created': created,
    };
  }

  factory FStripe.fromMap(Map<String, dynamic> map) {
    return FStripe(
      id: map['id'],
      amount: map['amount'],
      client: map['client'],
      mode: map['mode'],
      currency: map['currency'],
      customerId: map['customerId'],
      ephemeralKeySecret: map['ephemeralKeySecret'],
      paymentIntentClientSecret: map['paymentIntentClientSecret'],
      created: map['created']?.toDate(),
    );
  }

  factory FStripe.fromFOrder(FOrder order) {
    return FStripe(
      id: order.id,
      amount: order.amount,
    );
  }
}