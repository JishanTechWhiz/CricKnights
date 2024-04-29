import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/Strings.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Login_Signup/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                makePage(
                    image: 'assets/images/Cricket2.png',
                    title: Strings.stepOneTitle,
                    content: Strings.stepOneContent),
                makePage(
                    reverse: true,
                    image: 'assets/images/Cricket-3.png',
                    title: Strings.stepTwoTitle,
                    content: Strings.stepTwoContent),
                makePage(
                    image: 'assets/images/Cricket4.png',
                    title: Strings.stepThreeTitle,
                    content: Strings.stepThreeContent),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  shape: const CircleBorder(),
                  onPressed: () {
                    currentIndex < 2
                        ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          image,
                          height: MediaQuery.of(context).size.width * 0.580,
                          width: MediaQuery.of(context).size.width * 0.580,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                )
              : const SizedBox(),
          FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Reggae One",
                    color: ColorSys.primary,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorSys.gray,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.w400),
              )),
          reverse
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        image,
                        height: MediaQuery.of(context).size.width * 0.580,
                        width: MediaQuery.of(context).size.width * 0.580,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(BuildContext context, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: MediaQuery.of(context).size.height * 0.01,
      width: isActive
          ? MediaQuery.of(context).size.width * 0.07
          : MediaQuery.of(context).size.width * 0.02,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: const Color(0xFFf75842),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(context, true));
      } else {
        indicators.add(_indicator(context, false));
      }
    }

    return indicators;
  }
}
