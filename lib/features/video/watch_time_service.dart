import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class WatchTimeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Timer? _timer;
  int _seconds = 0;

  void startTracking(String videoId) {
    _seconds = 0;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
    });
  }

  Future<void> stopTracking(String videoId) async {
    _timer?.cancel();

    if (_seconds < 1) return;

    await _firestore.collection("videos").doc(videoId).update({
      "watchTime": FieldValue.increment(_seconds),
    });

    _seconds = 0;
  }
}