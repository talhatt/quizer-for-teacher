import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/edit_screen.dart';
import 'package:quizer/constants.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.collectionName,
    required this.name,
  }) : super(key: key);
  final String collectionName;
  final String name;

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
                              delete(document);
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
                            onPressed: () {}, icon: Icon(Icons.play_circle)),
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

  Future<void> delete(DocumentSnapshot<Object?> document) =>
      document.reference.delete();
}
