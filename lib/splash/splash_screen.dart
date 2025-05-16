// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash/Button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            Text(
              'Welcome App',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            // Button To Navigate to Login
            ButtonWidget(text: 'Go to Login', uri: '/login'),
            ButtonWidget(text: 'Go to Sign Up', uri: '/signup'),
          ],
        ),
      ),
    );
  }
}
