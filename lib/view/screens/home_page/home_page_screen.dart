import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop_app/view/screens/second_page/second_page_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RNW",
          style: TextStyle(
            color: Colors.black,
            fontSize: textScaler.scale(25),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: w * 0.06,
            backgroundColor: Colors.grey.shade200,
            child: CircleAvatar(
              radius: w * 0.05,
              backgroundColor: Colors.white,
              foregroundImage:
                  const AssetImage("assets/images/home_page/rnw_logo.png"),
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.1),
        child: Column(
          children: [
            const Expanded(
              child: Image(
                image: AssetImage("assets/gif/app_dev.gif"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, _) =>
                                  SecondPageScreen(
                                day: "Day 3",
                              ),
                              transitionDuration: const Duration(seconds: 2),
                              reverseTransitionDuration:
                                  const Duration(seconds: 2),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                Offset begin = const Offset(0.0, -1.0);
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
                        title: Text(
                          "DAY",
                          style: TextStyle(
                            fontSize: textScaler.scale(33),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Transform.scale(
                          scale: 2.5,
                          child: Image.asset(
                            "assets/images/home_page/Day 3.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, _) =>
                                  SecondPageScreen(
                                day: "Day 4",
                              ),
                              transitionDuration: const Duration(seconds: 2),
                              reverseTransitionDuration:
                                  const Duration(seconds: 2),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                        title: Text(
                          "DAY",
                          style: TextStyle(
                            fontSize: textScaler.scale(33),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Transform.scale(
                          scale: 2.5,
                          child: Image.asset(
                            "assets/images/home_page/Day 4.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, _) =>
                                  SecondPageScreen(
                                day: "Day 5",
                              ),
                              transitionDuration: const Duration(seconds: 2),
                              reverseTransitionDuration:
                                  const Duration(seconds: 2),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                Offset begin = const Offset(0.0, 1.0);
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
                        title: Text(
                          "DAY",
                          style: TextStyle(
                            fontSize: textScaler.scale(33),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Transform.scale(
                          scale: 2.5,
                          child: Image.asset(
                            "assets/images/home_page/Day 5.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
