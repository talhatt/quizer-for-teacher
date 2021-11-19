import 'package:flutter/material.dart';
import 'package:quizer/components/edit_screen.dart';
import 'package:quizer/views/authentication/signin_screen.dart';
import 'package:quizer/views/authentication/signup_screen.dart';
import 'package:quizer/views/home_screen.dart';
import 'package:quizer/views/profile_screen.dart';
import 'package:quizer/views/questions_screen.dart';
import 'package:quizer/views/reports_screen.dart';
import 'package:quizer/views/results_screen.dart';
import 'package:quizer/views/rooms_screen.dart';
import 'package:quizer/views/support_screen.dart';
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
  SignupScreen.routeName: (context) => SignupScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
