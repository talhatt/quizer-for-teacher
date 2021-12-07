import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/models/questions/question.dart';
import 'package:quizer/views/create_questions_screen.dart';

class MultipleChoiceScreen extends StatefulWidget {
  MultipleChoiceScreen({Key? key, required this.question}) : super(key: key);
  Question question;

  @override
  State<MultipleChoiceScreen> createState() => _MultipleChoiceScreenState();
}

class _MultipleChoiceScreenState extends State<MultipleChoiceScreen> {
  List<bool> isSelected = [false, false, false, false];
  String? questionText;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    saveQuestion() {
      widget.question.question = questionText ?? "Null";
      widget.question.option1 = option1 ?? "Null";
      widget.question.option2 = option2 ?? "Null";
      widget.question.option3 = option3 ?? "Null";
      widget.question.option4 = option4 ?? "Null";
      print(widget.question.questionType);
      print(widget.question.question);
      print(widget.question.correctAnswer);
      print(widget.question.option1);
      print(widget.question.option2);
      print(widget.question.option3);
      print(widget.question.option4);
    }

    deleteQuestion() {
      widget.question.questionType = "null";
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
                isSaved ? deleteQuestion() : saveQuestion();
                setState(() {
                  isSaved = !isSaved;
                });
              },
              icon: isSaved
                  ? Icon(Icons.close, color: Colors.red)
                  : Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
            ),
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
                  buildChoiceContainer("A"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            option1 = value;
                          });
                        },
                        //controller: controller,
                        decoration: InputDecoration(
                          hintText: "Cevap A",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  buildChoiceContainer("B"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            option2 = value;
                          });
                        },
                        //controller: controller,
                        decoration: InputDecoration(
                          hintText: "Cevap B",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  buildChoiceContainer("C"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            option3 = value;
                          });
                        },
                        //controller: controller,
                        decoration: InputDecoration(
                          hintText: "Cevap C",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  buildChoiceContainer("D"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            option4 = value;
                          });
                        },
                        //controller: controller,
                        decoration: InputDecoration(
                          hintText: "Cevap D",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                isSelected = [false, false, false, false];
                isSelected[index] = !isSelected[index];
                widget.question.correctAnswer =
                    "option" + (index + 1).toString();
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

  Padding buildChoiceContainer(String letter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(letter,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Padding buildTextField(String? text, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            questionText = value;
          });
        },
        //controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
