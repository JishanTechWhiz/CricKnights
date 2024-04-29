import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/About/about_tournament.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Matches/match_schedule.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Points_Table/inputPointTable.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Points_Table/points_table.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Teams/total_team.dart';

class TournamentTabbar extends StatefulWidget {
  final List<dynamic>? tournamentData;
  final int? selectIndex;
  final int? tournamentId;
  // final int tournamentId;
  const TournamentTabbar({
    Key? key,
    this.tournamentData,
    this.selectIndex,
    this.tournamentId,
  }) : super(key: key);

  @override
  State<TournamentTabbar> createState() => _TournamentTabbarState();
}

class _TournamentTabbarState extends State<TournamentTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: const Color(0xFFf0fff0),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PointTableForm(
                                tournamentId: widget.tournamentId!,
                              )));
                },
                icon: Icon(Icons.edit))
          ],
          title: const Text('Tournamet Name'),
          //backgroundColor: const Color(0xFF06d6a0),
          backgroundColor: kMyColor,

          //backgroundColor: kPrimaryColors,
          //backgroundColor: Colors.blueGrey[900],
          bottom: const TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 15.0),
            tabs: [
              Tab(
                // icon: Icon(Icons.chat_bubble),
                text: "MATCHES SCHEDULE",
              ),
              Tab(
                // icon: Icon(Icons.video_call),
                text: "TOTAL TEAMS",
              ),
              Tab(
                // icon: Icon(Icons.video_call),
                text: "POINTS TABLE",
              ),
              Tab(
                // icon: Icon(Icons.video_call),
                text: "ABOUT",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MatchSchedule(),
            FindTeam(
              tourIdz: widget.tournamentId!,
            ),
            PointTable(
              tournamentId: widget.tournamentId!,
            ),
            AboutTournament(
                tournamentData: widget.tournamentData!,
                selIndex: widget.selectIndex!),
          ],
        ),
      ),
    );
  }
}
