import 'package:flutter/material.dart';
import 'package:my_cricket/screens/IPL_API/1_2.dart';
import 'package:my_cricket/screens/IPL_API/1_3.dart';

import '1_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Row(
            children: [
              // Container(
              //   height: 30,
              //   width: 30,
              //   child:
              //       Image.asset('lib/images/ball.png', color: Colors.white38),
              // ),
              // SizedBox(width: 10),
              Text(
                'CricScore',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text('Live',
                      style: TextStyle(fontSize: 18, color: Colors.white))),
              Tab(
                  child: Text('Past',
                      style: TextStyle(fontSize: 18, color: Colors.white))),
              Tab(
                  child: Text('Upcoming',
                      style: TextStyle(fontSize: 18, color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyHomePages(),
            PastMatches(),
            FixtureMatches(),
          ],
        ),
      ),
    );
  }
}
