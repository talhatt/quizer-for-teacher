import 'package:flutter/material.dart';
import 'package:quizer/views/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  static String routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        child: Image.asset("assets/logo/quizer.gif"),
      ),
    );
  }
}
