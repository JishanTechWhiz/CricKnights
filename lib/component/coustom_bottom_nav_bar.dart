import 'package:flutter/cupertino.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/screens/BoxCricket/Box_Screen.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
import 'package:my_cricket/screens/MyCricket/cricket_screen.dart';
import 'package:my_cricket/screens/News/news_page.dart';
import 'package:my_cricket/screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    //final Color inActiveIconColor = Colors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            //blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(40),
        //   topRight: Radius.circular(40),
        // ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    // ignore: deprecated_member_use
                    color: MenuState.home == selectedMenu
                        ? kMyColor
                        : inActiveIconColor,
                  ),
                  // onPressed: () => Navigator.of(context).pushReplacement(
                  //   CupertinoPageRoute(
                  //     builder: (context) => const HomeScreen(),
                  //   ),
                  // ),
                  onPressed: () {
                    MenuState.home == selectedMenu
                        ? null
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                  }),
              IconButton(
                // icon: Icon(
                //   Icons.search_outlined,
                //   size: 30.0,
                //   color: Colors.grey,
                // ),
                icon: SvgPicture.asset(
                  "assets/icons/s1.svg",
                  // ignore: deprecated_member_use
                  color: MenuState.search == selectedMenu
                      ? kMyColor
                      : inActiveIconColor,
                  // ignore: deprecated_member_use
                  //color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BoxCricket(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/w1.svg",
                  // ignore: deprecated_member_use
                  color: MenuState.myCricket == selectedMenu
                      ? kMyColor
                      : inActiveIconColor,
                ),
                // icon: Icon(
                //   Icons.search_outlined,
                //   size: 30.0,
                //   color: Colors.grey,
                // ),
                //icon: SvgPicture.asset("assets/icons/search.svg"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const CricketScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/n2.svg",

                  //color: Colors.grey,
                  // ignore: deprecated_member_use
                  color: MenuState.news == selectedMenu
                      ? kMyColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => const NewsScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    // ignore: deprecated_member_use
                    color: MenuState.profile == selectedMenu
                        ? kMyColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => {
                        // Navigator.of(context).push(
                        //   CupertinoPageRoute(
                        //     builder: (context) => const ProfileScreen(),
                        //   ),
                        // ),

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen())),
                      }

                  //Navigator.pushNamed(context, ProfileScreen.routeName),
                  ),
            ],
          )),
    );
  }
}
