import 'package:flutter/material.dart';
import 'package:workshop_app/view/screens/home_page/home_page_screen.dart';
import 'package:workshop_app/view/screens/splash_screen/splash_page_screen.dart';

class WorkShopApp extends StatelessWidget {
  const WorkShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
