import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  Report({Key? key}) : super(key: key);
  static String routeName = "/reports";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Raporlar sayfası")),
    );
  }
}
