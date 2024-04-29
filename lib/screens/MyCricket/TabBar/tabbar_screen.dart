import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/match_body.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/tournament_body.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('My Cricket'),
          //backgroundColor: const Color(0xFF06d6a0),
          backgroundColor: kMyColor,
          //backgroundColor: Colors.blueGrey[900],
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 15.0),
            tabs: [
              Tab(
                // icon: Icon(Icons.chat_bubble),
                text: "MATCHES",
              ),
              Tab(
                // icon: Icon(Icons.video_call),
                text: "TOURNAMENT",
              ),
              // Tab(
              //   // icon: Icon(Icons.video_call),
              //   text: "TEAMS",
              // ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [MatcheBody(), TournamentBody()],
        ),
      ),
    );
  }
}
