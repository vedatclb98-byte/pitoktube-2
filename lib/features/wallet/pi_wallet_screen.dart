import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PiWalletScreen extends StatelessWidget {
  final String userId;

  const PiWalletScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection("earnings")
        .doc(userId)
        .snapshots();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Pi Wallet"),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: ref,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data();

          final balance = data?["piBalance"] ?? 0.0;

          return Center(
            child: Text(
              "₱ ${balance.toStringAsFixed(4)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}