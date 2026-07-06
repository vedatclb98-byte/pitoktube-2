import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🚫 USER BAN KONTROL
  Future<bool> isBanned(String userId) async {
    final doc = await _firestore
        .collection("banned_users")
        .doc(userId)
        .get();

    return doc.exists;
  }

  // 🔐 LOGIN KONTROL (örnek kullanım)
  Future<bool> canLogin(String userId) async {
    final banned = await isBanned(userId);

    if (banned) {
      return false;
    }

    return true;
  }

  // 🧠 OPTIONAL: LOGIN SONRASI CHECK
  Future<void> handleLoginCheck(String userId) async {
    final banned = await isBanned(userId);

    if (banned) {
      throw Exception("Bu kullanıcı banlı.");
    }
  }
}