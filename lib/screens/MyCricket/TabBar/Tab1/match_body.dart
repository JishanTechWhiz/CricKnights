import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/find_team.dart';
// import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
// import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/match_header.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/matches_screen.dart';

class MatcheBody extends StatefulWidget {
  const MatcheBody({super.key});

  @override
  State<MatcheBody> createState() => _MatcheBodyState();
}

class _MatcheBodyState extends State<MatcheBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.myCricket,
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            // Text('Hello'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const MatchHeader(),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            const Expanded(child: MatcheScreen()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag',
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FindTeam(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: kMyColor,
      ),
    );
  }
}
