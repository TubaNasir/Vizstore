class Notification {
  final String title;
  final DateTime time;

  Notification({
    required this.title,
    required this.time,
  });
}

List<Notification> notificationList = [
  Notification(title: "Your order abc is on it's way!", time: DateTime.now()),
  Notification(title: "Your order abc is on it's way!", time: DateTime.now()),
  Notification(title: "Your order abc is on it's way!", time: DateTime.now()),
  Notification(title: "Your order abc is on it's way!", time: DateTime.now())

];