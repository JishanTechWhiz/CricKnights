import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cricket/helpers/constants.dart';
//import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/find_team.dart';

class PlayMatch extends StatelessWidget {
  const PlayMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Select Playing Teams',
        ),
      ),
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Center(
            child: Container(
              width: 90.0, // Adjust the size as needed
              height: 90.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Customize the button color
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  weight: 60.0,
                ), // Customize the button icon
                color: Colors.white, // Customize the icon color
                onPressed: () {
                  // Add your button click functionality here
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const FindTeam(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: kMyColor,
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.50,
            child: const Center(
                child: Text(
              'SELECT TEAM A',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/icons/war-swords-cross-svgrepo-com.svg",
              height: 50,
              width: 50,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
            child: Container(
              width: 90.0, // Adjust the size as needed
              height: 90.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Customize the button color
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  weight: 60.0,
                ), // Customize the button icon
                color: Colors.white, // Customize the icon color
                onPressed: () {
                  // Add your button click functionality here
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const FindTeam(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: kMyColor,
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.50,
            child: const Center(
                child: Text(
              'SELECT TEAM B',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
          )),
        ],
      )),
    );
  }
}
