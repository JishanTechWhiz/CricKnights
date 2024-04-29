import 'package:flutter/material.dart';
// import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
// import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/tournament_header.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/tournament_screen.dart';

class TournamentBody extends StatefulWidget {
  const TournamentBody({super.key});

  @override
  State<TournamentBody> createState() => _TournamentBody();
}

class _TournamentBody extends State<TournamentBody> {
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
            const TournamentHeader(),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            const Expanded(child: TournamentScreen()),
          ],
        ),
      ),
    );
  }
}
