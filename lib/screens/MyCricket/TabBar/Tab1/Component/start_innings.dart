import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class StartInnings extends StatelessWidget {
  const StartInnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Toss',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'Who Won the toss?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          tossBody(context, 'Team A', 'Team B', Icons.groups_2_outlined),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          const Text(
            'Winner of the toss elected to?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          tossBody(
              context, 'Batting', 'Bowling', Icons.sports_cricket_outlined),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //     CupertinoPageRoute(
                //       builder: (context) => const StartInnings(),
                //     ),
                //   );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kMyColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "LET'S PLAY",
                    style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget tossBody(BuildContext context, String p1, String p2, IconData i1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: kMyColor
                  //color: Color(0xFFF0FFF0),
                  ),
              height: 140,
              width: 140,
            ),
            Positioned(
              left: 40,
              top: 30,
              child: CircleAvatar(
                maxRadius: 30,
                child: Icon(
                  i1,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 100,
              child: Text(
                p1,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.08,
      ),
      InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: kMyColor
                  //color: Color(0xFFF0FFF0),
                  ),
              height: 140,
              width: 140,
            ),
            Positioned(
              left: 40,
              top: 30,
              child: CircleAvatar(
                maxRadius: 30,
                child: Icon(
                  i1,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 100,
              child: Text(
                p2,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      )
    ],
  );
}
