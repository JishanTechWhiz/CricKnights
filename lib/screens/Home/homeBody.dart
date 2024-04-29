import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/Compo/categories.dart';
import 'package:my_cricket/screens/Home/Compo/home_header.dart';
import 'package:my_cricket/screens/Home/Compo/new_title.dart';
import 'package:my_cricket/screens/Home/Compo/news_pages.dart';
import 'package:my_cricket/screens/Home/Compo/special_offer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //UserInfo(),
            // SizedBox(height: getProportionateScreenHeight(20)),
            //SearchBox(),
            //searchBox(),
            const HomeHeader(),
            //const SearchMedical(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // const DiscountBanner(),
            // SizedBox(height: getProportionateScreenHeight(10)),
            const Categories(),
            SizedBox(height: getProportionateScreenHeight(10)),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(30)),
            //PopularProducts(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              child: const HomeTitleWidget(title: 'Trending'),
            ),
            //SizedBox(height: getProportionateScreenHeight(10)),
            const MyNews(),
            SizedBox(height: getProportionateScreenHeight(30)),
          ],
        ),
      ),
    );
  }
}
