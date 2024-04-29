import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/homeBody.dart';
import 'package:my_cricket/screens/Menubar/nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      //appBar: homeAppBar(context),
      drawer: NavBar(),
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
