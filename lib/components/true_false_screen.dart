import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/models/questions/question.dart';

class TrueFalseScreen extends StatefulWidget {
  const TrueFalseScreen({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  State<TrueFalseScreen> createState() => _TrueFalseScreenState();
}

class _TrueFalseScreenState extends State<TrueFalseScreen> {
  List<bool> isSelected = [false, false];
  String? questionText;
  TextEditingController trueController = TextEditingController(text: "Doğru");
  TextEditingController falseController = TextEditingController(text: "Yanlış");
  @override
  Widget build(BuildContext context) {
    saveQuestion() {
      widget.question.question = questionText ?? "Null";
      print(widget.question.questionType);
      print(widget.question.question);
      print(widget.question.correctAnswer);
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      questionText = value;
                    });
                  },
                  //controller: controller,
                  decoration: InputDecoration(
                    hintText: "Bir soru yazın",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  saveQuestion();
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ))
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.green,
            direction: Axis.vertical,
            selectedBorderColor: Colors.green,
            fillColor: Colors.green,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: trueController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: falseController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ],
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                isSelected = [false, false];
                isSelected[index] = !isSelected[index];
                (index == 0)
                    ? widget.question.correctAnswer = "true"
                    : widget.question.correctAnswer = "false";
              });
            },
          ),
        ),
        buildDivider(),
      ],
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(
        color: primaryColor,
        thickness: 2,
      ),
    );
  }
}
