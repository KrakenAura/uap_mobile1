import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardController {
  final CollectionReference leaderboard =
      FirebaseFirestore.instance.collection('leaderboard');

  Future<void> addUserToLeaderboard(String username, int score) async {
    await leaderboard.add({
      'username': username,
      'score': score,
    });
  }
}
