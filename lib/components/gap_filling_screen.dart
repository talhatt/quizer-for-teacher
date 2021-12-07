import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/models/questions/question.dart';

class GapFillingScreen extends StatefulWidget {
  const GapFillingScreen({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  State<GapFillingScreen> createState() => _GapFillingScreenState();
}

class _GapFillingScreenState extends State<GapFillingScreen> {
  String? questionText;
  String? correctAnswer;
  @override
  Widget build(BuildContext context) {
    saveQuestion() {
      widget.question.question = questionText ?? "Null";
      widget.question.correctAnswer = correctAnswer ?? "Null";
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
        TextField(
          onChanged: (value) {
            setState(() {
              correctAnswer = value;
            });
          },
          //controller: controller,
          decoration: InputDecoration(
            hintMaxLines: 4,
            hintText:
                "Doğru kabul edeceğiniz cevapları aralarında virgül bırakarak giriniz. Örnek: cevap1,cevap2,cevap3 gibi",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
