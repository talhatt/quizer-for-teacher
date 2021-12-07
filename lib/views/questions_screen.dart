import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/custom_list_view.dart';

class Question extends StatefulWidget {
  static String routeName = "/questions";
  late String? docId;

  Question({Key? key, this.docId}) : super(key: key);

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
          (widget.docId == null)
              ? CustomListView(collectionName: 'questions', name: "Soru")
              : CustomListView(
                  collectionName: 'questions',
                  name: "Soru",
                  docId: widget.docId,
                ),
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
