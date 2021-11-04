import 'package:flutter/material.dart';
import 'package:quizer/routes.dart';
import 'package:quizer/views/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Quizer',
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
