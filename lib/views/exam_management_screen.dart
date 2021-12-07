import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/views/live_exam_screen.dart';
import '../constants.dart';

class ExamManagementScreen extends StatefulWidget {
  ExamManagementScreen({Key? key, required this.docId}) : super(key: key);
  final String docId;

  @override
  _ExamManagementScreenState createState() => _ExamManagementScreenState();
}

class _ExamManagementScreenState extends State<ExamManagementScreen> {
  bool showResults = false;
  bool switchBetweenQuestions = false;
  bool threeWrongsOneTrue = false;
  bool autoSave = false;
  TextEditingController totalTime = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser!.uid;
  int totalTime2 = 0;

  void saveSettings({required String docId}) {
    DocumentReference document =
        FirebaseFirestore.instance.collection("examManagement").doc(docId);
    String examLoginCode =
        docId.substring(0, 4) + docId.substring(docId.length - 4);

    document.set({
      'userId': userId,
      'totalTime': totalTime2,
      'showResults': showResults,
      'switchBetweenQuestions': switchBetweenQuestions,
      'threeWrongsOneTrue': threeWrongsOneTrue,
      'autoSave': autoSave,
      'examLoginCode': examLoginCode,
    }, SetOptions(merge: true)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LiveExamScreen(
                    examLoginCode: examLoginCode,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sınav ayarları",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              buildDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 5, child: Text("Sınav süresi (dk):")),
                  Expanded(
                      child: TextField(
                    onChanged: (value) => setState(() {
                      totalTime2 = int.parse(value);
                    }),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 5, child: Text("Sonuçları anlık gösterilsin mi?")),
                  Expanded(
                    child: Switch.adaptive(
                        value: showResults,
                        onChanged: (value) => setState(() {
                              showResults = value;
                            })),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 5,
                      child: Text("Sorular arasında geçişe izin verilsin mi?")),
                  Expanded(
                    child: Switch.adaptive(
                        value: switchBetweenQuestions,
                        onChanged: (value) => setState(() {
                              switchBetweenQuestions = value;
                            })),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 5,
                      child: Text("Üç yanlış bir doğruyu götürsün mü?")),
                  Expanded(
                    child: Switch.adaptive(
                        value: threeWrongsOneTrue,
                        onChanged: (value) => setState(() {
                              threeWrongsOneTrue = value;
                            })),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 5,
                      child: Text("Sonuçlar otomatik kaydedilsin mi?")),
                  Expanded(
                    child: Switch.adaptive(
                        value: autoSave,
                        onChanged: (value) => setState(() {
                              autoSave = value;
                            })),
                  ),
                ],
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          child: Text("Kaydet"),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
          ),
          onPressed: () {
            saveSettings(docId: widget.docId);
          }),
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
