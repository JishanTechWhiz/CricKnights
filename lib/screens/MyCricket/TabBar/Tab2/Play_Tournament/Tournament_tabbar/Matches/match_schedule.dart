import 'package:flutter/material.dart';

class MatchSchedule extends StatelessWidget {
  const MatchSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 1:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '1', 'Team 1', 'Team 2'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '2', 'Team 3', 'Team 4'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '3', 'Team 5', 'Team 6'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 2:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '4', 'Team 1', 'Team 3'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '5', 'Team 2', 'Team 5'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '6', 'Team 4', 'Team 6'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 3:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '7', 'Team 1', 'Team 4'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '8', 'Team 2', 'Team 6'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '9', 'Team 3', 'Team 5'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 4:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '10', 'Team 2', 'Team 3'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '11', 'Team 1', 'Team 6'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '12', 'Team 4', 'Team 5'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 5:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '13', 'Team 3', 'Team 6'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '14', 'Team 1', 'Team 5'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '15', 'Team 2', 'Team 4'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Week 6:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '16', 'Team 4', 'Team 3'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '17', 'Team 5', 'Team 1'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchData(context, '18', 'Team 6', 'Team 2'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Final:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            matchData(context, '16', 'Team A', 'Team B'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

Widget matchData(
    BuildContext context, String matchNo, String teamOne, String teamTwo) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the shadow direction
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Match $matchNo',
                style: const TextStyle(fontSize: 17.0),
              ),
              const Text(
                'HL Ground,Ahmedabad | 29-Oct-23 | 20 Ov.',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          const Divider(
            color: Colors.black38,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            //width: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  teamOne,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.10,
                ),
                const Text(
                  'Vs',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.10,
                ),
                Text(
                  teamTwo,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black38,
          ),
          const Text(
            '8:00 pm',
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    ),
  );
}
