// leaderboard_controller.dart
import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_page.dart';

class LocalLeaderboardController extends GetxController {
  RxList<LeaderboardEntry> entries = <LeaderboardEntry>[].obs;

  void addEntry(LeaderboardEntry entry) {
    entries.add(entry);
    entries.sort((a, b) => b.score.compareTo(a.score));
  }
}
