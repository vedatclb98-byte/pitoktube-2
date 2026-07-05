class TipModel {
  final String sender;
  final String receiver;
  final double amount;
  final DateTime createdAt;

  const TipModel({
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.createdAt,
  });
}