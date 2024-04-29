//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/tabbar_screen.dart';

class CricketScreen extends StatelessWidget {
  const CricketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.myCricket),
      body: TabbarExample(),
    );
  }
}
