import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Profile/profile_screen.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(25)),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                "assets/icons/menu2.svg",
                // ignore: deprecated_member_use
                color: kWhite,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              children: const [
                TextSpan(
                  text: "Cric",
                  style: TextStyle(
                    color: ksecondaryColor,
                    fontFamily: "Reggae One",
                  ),
                ),
                TextSpan(
                  text: "Knights",
                  style: TextStyle(
                    color: kPrimaryColors,
                    fontFamily: "Reggae One",
                  ),
                ),
              ],
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(5),
              child: const CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
            ),
          )),
    );
  }
}
