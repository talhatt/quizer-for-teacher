import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/progress_bar.dart';
import 'package:quizer/constants.dart';

class LiveExamScreen extends StatefulWidget {
  LiveExamScreen(
      {Key? key,
      required this.docId,
      required this.totalTime,
      required this.examLoginCode})
      : super(key: key);
  final String docId;
  final String examLoginCode;
  final int totalTime;

  @override
  _LiveExamScreenState createState() => _LiveExamScreenState();
}

class _LiveExamScreenState extends State<LiveExamScreen> {
  final List<String> columnsName = ['Sıra', 'Ad Soyad', 'No', 'Doğru Sayısı'];
  late int _leftTime;
  late Timer _timer;
  getStudents() {
    Query studentsStream = FirebaseFirestore.instance
        .collection('students')
        .where("examLoginCode", isEqualTo: widget.examLoginCode)
        .orderBy('correctAnswerCounter', descending: true);
    return studentsStream;
  }

  List<DataColumn> getColumnNames() {
    return columnsName
        .map(
          (value) => DataColumn(
            label: Text(value),
          ),
        )
        .toList();
  }

  void startTimer() {
    _leftTime = widget.totalTime;
    const oneSec = const Duration(minutes: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_leftTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _leftTime--;
            FirebaseFirestore.instance
                .collection('examManagement')
                .doc(widget.docId)
                .update({
              'leftTime': _leftTime,
            });
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: FAProgressBar(
              currentValue: _leftTime,
              size: 25,
              maxValue: widget.totalTime,
              changeColorValue: 100,
              changeProgressColor: primaryColor,
              backgroundColor: secondaryColor,
              progressColor: Colors.red,
              animatedDuration: const Duration(milliseconds: 300),
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              displayText: 'dk kaldı.',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  return Text(snapshot.error.toString());
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                int studentCounter = 0;
                return DataTable(
                  horizontalMargin: 5,
                  columnSpacing: 23,
                  columns: getColumnNames(),
                  rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    studentCounter++;
                    return DataRow(cells: <DataCell>[
                      DataCell(
                        Center(child: Text(studentCounter.toString())),
                      ),
                      DataCell(
                        Text(
                            data['studentName'] + " " + data['studentSurName']),
                      ),
                      DataCell(
                        Align(
                            alignment: Alignment.center,
                            child: Text(data['studentNumber'])),
                      ),
                      DataCell(
                        Align(
                            alignment: Alignment.center,
                            child:
                                Text(data['correctAnswerCounter'].toString())),
                      ),
                    ]);
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
