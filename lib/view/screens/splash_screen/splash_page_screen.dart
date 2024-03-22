import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workshop_app/view/screens/home_page/home_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, _) => const HomePageScreen(),
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Offset begin = const Offset(1.0, 0.0);
              Offset end = Offset.zero;
              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: Curves.easeInOut),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(w * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/home_page/rnw_logo.png",
                height: h * 0.18,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Image.asset(
                "assets/images/second_page/rnw_logo.png",
                height: h * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
