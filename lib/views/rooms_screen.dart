import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/components/custom_header.dart';
import 'package:quizer/components/custom_list_view.dart';

class Room extends StatefulWidget {
  Room({Key? key}) : super(key: key);
  static String routeName = "/rooms";

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            CustomHeader(title: "Oda Oluştur"),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text("Oluştur")),
            CustomHeader(title: "Odalarım"),
            CustomListView(),
          ],
        ));
  }
}
