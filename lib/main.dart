import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Login/login_model.dart';
import 'package:flutter_application_1/Auth/SignUp/signup_model.dart';
import 'package:flutter_application_1/add_items/item_model.dart';
import 'package:flutter_application_1/dashboard/nav_bar.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';
import 'package:flutter_application_1/profile/user_Model.dart';
import 'package:flutter_application_1/Auth/Login/login_screen.dart';
import 'package:flutter_application_1/Auth/SignUp/signup_screen.dart';
import 'package:flutter_application_1/splash/splash_Animated.dart';
import 'package:flutter_application_1/splash/splash_model.dart';
import 'package:flutter_application_1/splash/splash_screen.dart';

// provider
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Provider Of UserModel
        ChangeNotifierProvider(create: (context) => UserModel()),
        // Provider Of ItemModel
        ChangeNotifierProvider(create: (context) => ItemModel()),
        //Provider Of The FavoriteModel
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
        //Provider Of The SplashModel
        ChangeNotifierProvider(create: (context) => SplashModel()),
        //Provider Of The LoginModel
        ChangeNotifierProvider(create: (context) => LoginModel()),
        //Provider Of The SignupModel
        ChangeNotifierProvider(create: (context) => SignupModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Section App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashAnimated(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const NavBar(),
      },
    );
  }
}
