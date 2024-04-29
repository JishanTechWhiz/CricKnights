import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/play_match.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/start_match.dart';

class MatchHeader extends StatelessWidget {
  const MatchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.black87,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.93,
        child: ListTile(
          leading: const Text(
            'Want to start a match?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          trailing: InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   CupertinoPageRoute(
              //     builder: (context) => const PlayMatch(),
              //   ),
              // );
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const StartMatchScreen(),
                ),
              );
            },
            child: const Text(
              'START A MATCH',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
