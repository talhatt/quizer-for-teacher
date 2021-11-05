import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  static String routeName = "/questions";

  Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Sorular sayfası")),
    );
  }
}
