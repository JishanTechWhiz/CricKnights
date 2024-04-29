import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cricket/screens/BoxCricket/Box_Screen.dart';
import 'package:my_cricket/screens/IPL_API/1.dart';
import 'package:my_cricket/screens/MyCricket/cricket_screen.dart';
import 'package:my_cricket/screens/NotFound/notFound.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/match2.svg", "text": "Match", "myStyle": 13.0},
      {
        "icon": "assets/icons/tournament.svg",
        "text": "Tournament",
        "myStyle": 13.0,
      },
      {"icon": "assets/icons/c1.svg", "text": "Box Cricket", "myStyle": 13.0},
      {
        "icon": "assets/icons/ls.svg",
        "text": "Live IPL Score",
        "myStyle": 12.0
      },
      {"icon": "assets/icons/donate.svg", "text": "Donate", "myStyle": 13.0},
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]['icon'],
            text: categories[index]['text'],
            myStyle: categories[index]['myStyle'],
            press: () {
              // Navigate to the appropriate screen when category card is pressed
              switch (index) {
                case 0: // Match
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CricketScreen()),
                  );
                  break;
                case 1: // Tournament
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CricketScreen()),
                  );
                  break;
                case 2: // Box Cricket
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BoxCricket()),
                  );
                  break;
                case 3: // IPL Live Score
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 4: // Donate
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotFoundPage()),
                  );
                  break;
                default:
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
    required this.myStyle,
  });

  final double myStyle;
  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  //color: Color(0xFFFFECDF),
                  //color: Colors.purple.shade100,
                  color: kMyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getProportionateScreenWidth(myStyle)),
            ),
          ],
        ),
      ),
    );
  }
}
