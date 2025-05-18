import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash/splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashAnimated extends StatelessWidget {
  const SplashAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: FlutterLogo(size: 300),
      nextScreen: SplashScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
      duration: 2000,
    );
  }
}
