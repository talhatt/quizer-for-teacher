import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/multiple_choice_screen.dart';
import 'package:quizer/components/true_false_screen.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/models/questions/question.dart';

class CreateQuestionsScreen extends StatefulWidget {
  CreateQuestionsScreen({Key? key}) : super(key: key);
  static String routeName = "/createQuestions";

  @override
  _CreateQuestionsScreenState createState() => _CreateQuestionsScreenState();
}

class _CreateQuestionsScreenState extends State<CreateQuestionsScreen> {
  List<Question> questions = [];
  TextEditingController questionName = TextEditingController();
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  saveQuestions() {
    firebase.collection("questions").doc(questionName.text).set({
      "name": questionName.text,
      "userId": FirebaseAuth.instance.currentUser!.uid,
    });
    for (var data in questions) {
      if (data.questionType == "multipleChoice") {
        firebase
            .collection("questions")
            .doc(questionName.text)
            .collection("question")
            .doc("Soru-" + (questions.indexOf(data) + 1).toString())
            .set({
          "question": data.question,
          "questionType": data.questionType,
          "correctAnswer": data.correctAnswer,
          "option1": data.option1,
          "option2": data.option2,
          "option3": data.option3,
          "option4": data.option4,
        }).then((value) => print("Soru eklendi"));
      } else if (data.questionType == "trueFalse") {
        firebase
            .collection("questions")
            .doc(questionName.text)
            .collection("question")
            .doc("Soru-" + (questions.indexOf(data) + 1).toString())
            .set({
          "question": data.question,
          "questionType": data.questionType,
          "correctAnswer": data.correctAnswer,
        }).then((value) => print("Soru eklendi"));
      } else if (data.questionType == "gapFilling") {
        firebase
            .collection("questions")
            .doc(questionName.text)
            .collection("question")
            .doc("Soru-" + (questions.indexOf(data) + 1).toString())
            .set({
          "question": data.question,
          "questionType": data.questionType,
          "correctAnswer": data.correctAnswer,
        }).then((value) => print("Soru eklendi"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(children: [
        Column(
          children: [
            CustomHeader(title: "Yeni soru seti oluştur"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: questionName,
                decoration: InputDecoration(
                  hintText: "Soru setinin adını yazın",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Soruları Kaydet"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                ),
                onPressed: () {
                  saveQuestions();
                },
              ),
            ),
            buildDivider(),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                if (questions[index].questionType == "multipleChoice") {
                  return Column(
                    children: [
                      Text("Soru - " + (index + 1).toString()),
                      MultipleChoiceScreen(question: questions[index]),
                    ],
                  );
                } else if (questions[index].questionType == "gapFilling") {
                  return Column(
                    children: [
                      Text("Soru - " + (index + 1).toString()),
                      MultipleChoiceScreen(question: questions[index]),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Text("Soru - " + (index + 1).toString()),
                      TrueFalseScreen(question: questions[index]),
                    ],
                  );
                }
              },
            ),
            CustomHeader(title: "Sorularınızı Oluşturun"),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                buildMenu(context, "Seçmeli", Colors.yellow,
                    "assets/icons/abc.svg", 0.3, 0.2, Question.multiple()),
                buildMenu(context, "D/Y", Colors.cyan, "assets/icons/true.svg",
                    0.3, 0.2, Question.trueFalse()),
                buildMenu(context, "Boşluk", Colors.orange,
                    "assets/icons/pencil.svg", 0.3, 0.2, Question.gapFilling()),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Material buildMenu(BuildContext context, String name, Color color,
      String svgSrc, double widthSize, double heightSize, Question question) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(200),
      shadowColor: Colors.black,
      elevation: 30,
      color: color,
      child: InkWell(
        onTap: () {
          setState(() {
            questions.add(question);
          });
        },
        child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * widthSize,
                  height: MediaQuery.of(context).size.width * heightSize,
                  child: SvgPicture.asset(
                    svgSrc,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: widthSize * 50,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ]),
      ),
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
