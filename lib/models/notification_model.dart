class NotificationModel {
  final String id;
  final String userId; // bildirimi alan
  final String fromUserId; // aksiyonu yapan
  final String type; // like, follow, comment
  final String message;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.fromUserId,
    required this.type,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "fromUserId": fromUserId,
      "type": type,
      "message": message,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map["id"],
      userId: map["userId"],
      fromUserId: map["fromUserId"],
      type: map["type"],
      message: map["message"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}