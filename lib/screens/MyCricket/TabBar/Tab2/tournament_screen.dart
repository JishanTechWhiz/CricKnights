import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Component/myTournament.dart';
// import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
// import 'package:my_cricket/helpers/enums.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myCricket),*/
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kMyColor,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      // height: 45,
                      // width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        //border: Border.all(color: Colors.black, width: 1)
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "MY TOURNAMENT",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                        // border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("ALL TOURNAMENT"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(children: [
            //IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            MyTournament(),
            Icon(Icons.movie),
            //Icon(Icons.games),
          ]),
        ),
      ),
    );
  }
}
