import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key, required this.data, required this.collectionName})
      : super(key: key);
  final String data;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

    FirebaseFirestore.instance
        .collection(collectionName)
        .doc(data)
        .get()
        .then((value) {
      name.text = value.data()!['name'];
    });

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Kaydet"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection(collectionName)
                    .doc(data)
                    .update({
                  "name": name.text,
                }).whenComplete(() {
                  Navigator.pop(context);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
