import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/constants.dart';

class LiveExamScreen extends StatefulWidget {
  LiveExamScreen({Key? key, required this.examLoginCode}) : super(key: key);
  final String examLoginCode;

  @override
  _LiveExamScreenState createState() => _LiveExamScreenState();
}

class _LiveExamScreenState extends State<LiveExamScreen> {
  getStudents() {
    Query studentsStream = FirebaseFirestore.instance
        .collection('students')
        .where("examLoginCode", isEqualTo: widget.examLoginCode);
    return studentsStream;
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
          CustomHeader(title: "Öğrenciler Listesi"),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getStudents().snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data != null && snapshot.data!.size == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(color: Colors.red),
                      Text("Öğrenci(ler) bekleniyor..."),
                      LinearProgressIndicator(color: Colors.blue),
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
                        subtitle: Text(data['studentNumber'],
                            style: TextStyle(color: Colors.white)),
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
          onPressed: () {}),
    );
  }
}
