import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/custom_list_view.dart';
import 'package:quizer/components/menu.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/views/create_questions_screen.dart';

class Question extends StatefulWidget {
  static String routeName = "/questions";

  Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomHeader(title: "Soru Hazırla"),
            buildButton(context),
          ]),
          CustomHeader(title: "Sorularım"),
          CustomListView(
            collectionName: 'questions',
            name: "Soru",
          )
        ],
      ),
    );
  }

  ElevatedButton buildButton(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        Icons.forward,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/createQuestions");
      },
    );
  }
}
