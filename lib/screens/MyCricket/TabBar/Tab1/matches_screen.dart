import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/highlight_match.dart';

class MatcheScreen extends StatefulWidget {
  const MatcheScreen({super.key});

  @override
  State<MatcheScreen> createState() => _MatcheScreenState();
}

class _MatcheScreenState extends State<MatcheScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.white,
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
                          "MY MATCHES",
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
                        child: Text("ALL MATCHES"),
                      ),
                    ),
                  ),
                  // Tab(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         border: Border.all(color: Colors.grey, width: 1)),
                  //     child: Align(
                  //       alignment: Alignment.center,
                  //       child: Text("GAMES"),
                  //     ),
                  //   ),
                  // ),
                ]),
          ),
          body: const TabBarView(children: [
            HighlightMatch(),
            //IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            //const Icon(Icons.movie),
            Icon(Icons.movie),
            //Icon(Icons.games),
          ]),
        ));
  }
}
