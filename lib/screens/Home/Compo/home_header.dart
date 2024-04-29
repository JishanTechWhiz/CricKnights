import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/Compo/app_bar.dart';
import 'package:my_cricket/screens/Home/Compo/search2.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(225),
      //padding: EdgeInsets.only(top: 0),
      decoration: const BoxDecoration(
        //color: Colors.red,
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/i2.png')),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UserInfo(),
          SizedBox(height: getProportionateScreenHeight(60)),
          const MySearchBar()
        ],
      ),
    );
  }
}
