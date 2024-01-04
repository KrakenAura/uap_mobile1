import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/controllers/local_leaderboard_controller.dart';

class LeaderboardView extends StatelessWidget {
  final LocalLeaderboardController leaderboardController;

  LeaderboardView({Key? key, LocalLeaderboardController? injectedController})
      : leaderboardController = injectedController ?? Get.find(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboardController.leaderboardData.length,
        itemBuilder: (context, index) {
          final entry = leaderboardController.leaderboardData[index];
          final username = entry['username'];
          final score = entry['score'];

          return ListTile(
            title: Text('$username - Score: $score'),
          );
        },
      ),
    );
  }
}
