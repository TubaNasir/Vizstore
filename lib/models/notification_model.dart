import 'package:flutterdemo/models/product_model.dart';

class NotificationItemJson {
  final String orderId;
  final String message;
  final bool read;
  final DateTime dateTime;

  const NotificationItemJson({
    required this.orderId,
    required this.message,
    this.read = false,
    required this.dateTime,
  });

  //const NotificationItemJson.empty() : orderId = '', message = '', read = false, dateTime = ;

  NotificationItemJson copyWith(
      {
        String? orderId,
        String? message,
        bool? read,
        DateTime? dateTime}
      ) =>
      NotificationItemJson(
        orderId: orderId ?? this.orderId,
        message: message ?? this.message,
        read: read ?? this.read,
        dateTime: dateTime ?? this.dateTime,
      );

  static NotificationItemJson fromJson(Map<String, dynamic> json) => NotificationItemJson(
    orderId: json["orderId"] as String? ?? '',
    message: json["message"] as String? ?? '',
    read: json["read"] as bool? ?? false,
    dateTime: json["dateTime"].toDate() as DateTime? ?? DateTime.now()
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "message": message,
    "read": read,
    "dateTime": dateTime
  };
}