import 'package:get/get.dart';

class LocalLeaderboardController {
  List<Map<String, dynamic>> _leaderboardData = [];

  List<Map<String, dynamic>> get leaderboardData => _leaderboardData;

  void addUserToLeaderboard(String username, int score) {
    print('Adding user to leaderboard: $username - $score');
    _leaderboardData.add({
      'username': username,
      'score': score,
    });
    // Sort the leaderboard by score in descending order
    _leaderboardData.sort((a, b) => b['score'].compareTo(a['score']));
  }

  RxList<LeaderboardEntry> entries = <LeaderboardEntry>[].obs;
  void addEntry(LeaderboardEntry entry) {
    entries.add(entry);
    entries.sort((a, b) => b.score.compareTo(a.score));
  }
}

class LeaderboardEntry {
  final String playerName;
  final int score;

  LeaderboardEntry({required this.playerName, required this.score});
}
