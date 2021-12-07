import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/custom_list_view.dart';

class Room extends StatefulWidget {
  Room({Key? key, this.docId}) : super(key: key);
  static String routeName = "/rooms";
  late String? docId;

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;

    createRoom() {
      FirebaseFirestore.instance.collection("rooms").doc().set({
        "name": name.text,
        "userId": auth.currentUser!.uid,
      });
    }

    clearText() {
      name.clear();
    }

    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            CustomHeader(title: "Oda Oluştur"),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Oda Adı",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            saveButton(createRoom, clearText),
            CustomHeader(title: "Odalarım"),
            (widget.docId == null)
                ? CustomListView(collectionName: 'rooms', name: "Oda")
                : CustomListView(
                    collectionName: 'rooms',
                    name: "Oda",
                    docId: widget.docId,
                  ),
          ],
        ));
  }

  ElevatedButton saveButton(Null createRoom(), Null clearText()) {
    return ElevatedButton(
      child: Text("Kaydet"),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange,
      ),
      onPressed: () {
        createRoom();
        clearText();
      },
    );
  }
}
