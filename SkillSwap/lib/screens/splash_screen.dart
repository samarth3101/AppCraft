import 'package:flutter/material.dart';
import 'dart:async';

import 'package:skill_swap_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentLetterIndex = 0;
  String _displayText = '';
  final String _fullText = 'SkillSwap';

  @override
  void initState() {
    super.initState();

    // Start letter-by-letter animation without blinking
    _animateText();

    // Navigate to the login screen with a smooth transition
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Smooth fade transition to login screen
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: child,
            ),
          );
        },
      ));
    });
  }

  // Function to animate text letter by letter
  void _animateText() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_currentLetterIndex < _fullText.length) {
        setState(() {
          _displayText += _fullText[_currentLetterIndex];
        });
        _currentLetterIndex++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          _displayText,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Colors.purple, Colors.blue],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
      ),
    );
  }
}