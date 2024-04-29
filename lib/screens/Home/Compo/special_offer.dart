import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/Compo/section_title.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Special for you",
          press: () {},
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/bg2.jpg",
                category: "Tournaments",
                numOfBrands: 6,
                myText: "Teams",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/v2.jpg",
                category: "Top Grounds",
                numOfBrands: 24,
                myText: "",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/bg1.jpg",
                category: "Cricket academy",
                numOfBrands: 18,
                myText: "",
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.myText,
    required this.press,
  });

  final String category, image, myText;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.only(
      //   left: getProportionateScreenWidth(20),
      // ),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(242),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF343434).withOpacity(0.4),
                    const Color(0xFF343434).withOpacity(0.15),
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10)),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: '$category\n',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '$numOfBrands $myText'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
