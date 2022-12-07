import 'package:flutterdemo/models/product_model.dart';

class NotificationItemJson {
  final String orderId;
  final String message;
  final bool read;

  const NotificationItemJson({
    required this.orderId,
    required this.message,
    this.read = false,
  });

  const NotificationItemJson.empty() : orderId = '', message = '', read = false;

  NotificationItemJson copyWith(
      {String? notificationId,
        String? orderId,
        String? message,
        bool? read}
      ) =>
      NotificationItemJson(
        orderId: orderId ?? this.orderId,
        message: message ?? this.message,
        read: read ?? this.read,
      );

  static NotificationItemJson fromJson(Map<String, dynamic> json) => NotificationItemJson(
    orderId: json["orderId"] as String? ?? '',
    message: json["message"] as String? ?? '',
    read: json["read"] as bool? ?? false
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "message": message,
    "read": read,
  };
}