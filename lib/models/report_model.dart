class ReportModel {
  final String id;
  final String videoId;
  final String reporterId;
  final String reason;
  final DateTime createdAt;

  ReportModel({
    required this.id,
    required this.videoId,
    required this.reporterId,
    required this.reason,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "videoId": videoId,
      "reporterId": reporterId,
      "reason": reason,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map["id"],
      videoId: map["videoId"],
      reporterId: map["reporterId"],
      reason: map["reason"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}