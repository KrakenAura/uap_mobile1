// import 'package:flutter/material.dart';
// import 'package:uap_mobile1/app/modules/Appwrite/controllers/local_leaderboard_controller.dart'; // Update this path

// class LeaderboardPage extends StatefulWidget {
//   final LocalLeaderboardController leaderboardController;

//   LeaderboardPage({required this.leaderboardController});

//   @override
//   _LeaderboardPageState createState() => _LeaderboardPageState();
// }

// class _LeaderboardPageState extends State<LeaderboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leaderboard'),
//       ),
//       body: StreamBuilder<List<Map<String, dynamic>>>(
//         stream: widget.leaderboardController.leaderboardStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Map<String, dynamic>> leaderboardData = snapshot.data!;
//             return leaderboardData.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: leaderboardData.length,
//                     itemBuilder: (context, index) {
//                       final user = leaderboardData[index];
//                       return Card(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: ListTile(
//                           title: Text('${user['username']}'),
//                           subtitle: Text('Score: ${user['score']}'),
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.blue,
//                             child: Text(
//                               (index + 1).toString(),
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : Center(
//                     child: Text('No leaderboard data available.'),
//                   );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error fetching leaderboard data.'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
