import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/views/live_exam_screen.dart';

class WaitingRoomScreen extends StatefulWidget {
  WaitingRoomScreen(
      {Key? key,
      required this.docId,
      required this.examLoginCode,
      required this.totalTime})
      : super(key: key);
  final String examLoginCode;
  final String docId;
  final int totalTime;

  @override
  _WaitingRoomScreenState createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  getStudents() {
    Query studentsStream = FirebaseFirestore.instance
        .collection('students')
        .where("examLoginCode", isEqualTo: widget.examLoginCode);
    return studentsStream;
  }

  startExam() {
    FirebaseFirestore.instance
        .collection('examManagement')
        .doc(widget.docId)
        .update({
      'examIsStarted': true,
    }).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LiveExamScreen(
            docId: widget.docId,
            examLoginCode: widget.examLoginCode,
            totalTime: widget.totalTime,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Giriş Kodu:  " + widget.examLoginCode,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          buildButton(),
          Row(
            children: [
              CustomHeader(title: "Öğrenci Listesi"),
              CircularProgressIndicator(
                color: Colors.orange,
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getStudents().snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data != null && snapshot.data!.size == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(color: Colors.orange),
                      Text("Öğrenci(ler) bekleniyor..."),
                      LinearProgressIndicator(color: Colors.orange),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return Text('Bir hata oluştu!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                int studentCounter = 1;
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Card(
                      child: ListTile(
                        tileColor: secondaryColor,
                        leading: Text((studentCounter++).toString()),
                        title: Text(
                            "${data['studentName']} ${data['studentSurName']}"),
                        subtitle: Text(
                          data['studentNumber'],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            document.reference.delete();
                          },
                          icon: Icon(Icons.delete_forever),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  SizedBox buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          child: Text("Sınavı Başlat"),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
          ),
          onPressed: () {
            startExam();
          }),
    );
  }
}
