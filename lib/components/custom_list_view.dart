import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/edit_screen.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/views/exam_management_screen.dart';
import 'package:quizer/views/questions_screen.dart';
import 'package:quizer/views/rooms_screen.dart';

class CustomListView extends StatelessWidget {
  CustomListView(
      {Key? key, required this.collectionName, required this.name, this.docId})
      : super(key: key);
  final String collectionName;
  final String name;
  late String? docId;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final Query _usersStream = FirebaseFirestore.instance
        .collection(collectionName)
        .where("userId", isEqualTo: auth.currentUser!.uid);

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null && snapshot.data!.size == 0) {
            return Center(
              child: Text("${name} listeniz boş görünüyor..."),
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

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text(data['name']),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    showAlertDialog(context, document),
                              );
                              ;
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditScreen(
                                            data: document.id,
                                            collectionName: collectionName,
                                          )));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              String fieldName = (collectionName == "rooms")
                                  ? "roomName"
                                  : "questionName";

                              DocumentReference examManagement;

                              if (docId == null) {
                                examManagement = FirebaseFirestore.instance
                                    .collection("examManagement")
                                    .doc();
                              } else {
                                examManagement = FirebaseFirestore.instance
                                    .collection("examManagement")
                                    .doc(docId);
                              }
                              print("docId : $docId");
                              print("examManagement.id : ${examManagement.id}");

                              examManagement.set({'$fieldName': data['name']},
                                  SetOptions(merge: true));

                              print(examManagement.id);

                              var docSnapshot = await FirebaseFirestore.instance
                                  .collection('examManagement')
                                  .doc(examManagement.id)
                                  .get();

                              if (docSnapshot.exists) {
                                Map<String, dynamic>? data = docSnapshot.data();
                                if (data?['roomName'] != null &&
                                    data?['questionName'] != null) {
                                  // go to ExamManagement screen with docId
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExamManagementScreen(
                                                  docId: examManagement.id)));
                                } else {
                                  fieldName == "roomName"
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Question(
                                                    docId: examManagement.id,
                                                  )))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Room(
                                                  docId: examManagement.id)));
                                }
                              }
                            },
                            icon: Icon(Icons.play_circle)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  AlertDialog showAlertDialog(
      BuildContext context, DocumentSnapshot<Object?> document) {
    return AlertDialog(
      elevation: 24,
      backgroundColor: secondaryColor,
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Text("Silmek istediğinize emin misiniz?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Hayır")),
        TextButton(
            onPressed: () {
              delete(document);
              Navigator.pop(context);
            },
            child: Text("Evet")),
      ],
    );
  }

  Future<void> delete(DocumentSnapshot<Object?> document) =>
      document.reference.delete();
}
