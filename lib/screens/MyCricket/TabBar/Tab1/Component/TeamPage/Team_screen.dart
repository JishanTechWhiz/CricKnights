// import 'package:flutter/material.dart';
// import 'package:my_cricket/helpers/constants.dart';
// import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/Player_Screen.dart';

// class TeamPlayer extends StatelessWidget {
//   final Map<String, dynamic> teamData;
//   const TeamPlayer({super.key, required this.teamData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kMyColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text(
//           'Team Players',
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined))
//         ],
//       ),
//       backgroundColor: const Color(0xFFf0fff0),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             Players(
//               name: 'Rohit Sharma',
//               role: 'C:Batter',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'Virat Kohli',
//               role: 'Batter',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'S Iyer',
//               role: 'Batter',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'S Yadav',
//               role: 'Batter',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'R Pant',
//               role: 'WK:Batter',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'R Jadeja',
//               role: 'All-Rounder',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'S Thakur',
//               role: 'All-Rounder',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'K Yadav',
//               role: 'bowler',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'M Siraj',
//               role: 'bowler',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'M Sami',
//               role: 'bowler',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Players(
//               name: 'J Bumrah',
//               role: 'bowler',
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/*****************************************/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/Player_Screen.dart';

class TeamPlayer extends StatefulWidget {
  final Map<String, dynamic> teamData;

  const TeamPlayer({Key? key, required this.teamData}) : super(key: key);

  @override
  State<TeamPlayer> createState() => _TeamPlayerState();
}

class _TeamPlayerState extends State<TeamPlayer> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> players = widget.teamData['Players'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Team Players',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined))
        ],
      ),
      backgroundColor: const Color(0xFFf0fff0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return Players(
                  name: player[
                      'Username'], // Assuming 'Username' is the key for player's name
                  role: player[
                      'Role'], // You need to fetch role from API or assign dynamically
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
