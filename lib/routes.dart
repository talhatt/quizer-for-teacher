import 'package:flutter/material.dart';
import 'package:quizer/views/home_screen.dart';
import 'package:quizer/views/profile.dart';
import 'package:quizer/views/questions.dart';
import 'package:quizer/views/reports.dart';
import 'package:quizer/views/results.dart';
import 'package:quizer/views/rooms.dart';
import 'package:quizer/views/support.dart';
import 'package:quizer/views/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Question.routeName: (context) => Question(),
  Room.routeName: (context) => Room(),
  Report.routeName: (context) => Report(),
  Result.routeName: (context) => Result(),
  Profile.routeName: (context) => Profile(),
  Support.routeName: (context) => Support(),
};
