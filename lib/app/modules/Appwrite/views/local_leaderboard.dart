import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/controllers/local_leaderboard_controller.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_page.dart';

class LeaderboardView extends StatelessWidget {
  final LocalLeaderboardController leaderboardController =
      Get.put(LocalLeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => ListView.builder(
            itemCount: leaderboardController.entries.length,
            itemBuilder: (context, index) {
              final entry = leaderboardController.entries[index];
              return ListTile(
                title: Text(entry.playerName),
                subtitle: Text('Score: ${entry.score}'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEntryDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddEntryDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Entry'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Player Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final playerName = nameController.text;
                final score = 0; // You can set an initial score
                if (playerName.isNotEmpty) {
                  leaderboardController.addEntry(
                      LeaderboardEntry(playerName: playerName, score: score));
                }
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
