import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  Room({Key? key}) : super(key: key);
  static String routeName = "/rooms";

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Odalar sayfası")),
    );
  }
}
