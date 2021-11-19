import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/custom_list_view.dart';
import 'package:quizer/components/menu.dart';
import 'package:quizer/constants.dart';

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
          CustomHeader(title: "Soru Hazırla"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Menu(
                name: "Seçmeli",
                color: Colors.yellow,
                routeName: "/questions",
                svgSrc: "assets/icons/abc.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "D/Y",
                color: Colors.cyan,
                routeName: "/questions",
                svgSrc: "assets/icons/true.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "Boşluk",
                color: Colors.orange,
                routeName: "/questions",
                svgSrc: "assets/icons/pencil.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "Karışık",
                color: Colors.redAccent,
                routeName: "/questions",
                svgSrc: "assets/icons/exclamation_mark.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
            ],
          ),
          CustomHeader(title: "Sorularım"),
          CustomListView(
            collectionName: 'questions',
            name: "Soru",
          )
        ],
      ),
    );
  }
}
