import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/onBoarding/onBoarding_screen.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.bounceOut,
      duration: 3000,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "CricKnight",
              style: TextStyle(
                  fontFamily: "Reggae One",
                  fontSize: MediaQuery.of(context).size.width * 0.100),
            ),
          ),

          Expanded(
            flex: 1,
            child: LoadingAnimationWidget.prograssiveDots(
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.15,
            ),
          )
          // Lottie.asset('assets/animations/Animation - 1704203799888.json')
        ],
      ),
      nextScreen: const OnboardingScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: kMyColor,
      // backgroundColor: const Color(0xFF06d6a0),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}
