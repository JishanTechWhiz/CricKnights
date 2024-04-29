import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Component/create_tournament.dart';

class TournamentHeader extends StatelessWidget {
  const TournamentHeader({super.key});

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
            'Want to host a tournament?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          trailing: InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const CreateTournament(),
                ),
              );
            },
            child: const Text(
              'REGISTER',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
