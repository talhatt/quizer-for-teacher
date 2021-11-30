import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';

class Report extends StatelessWidget {
  Report({Key? key}) : super(key: key);
  static String routeName = "/reports";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(color: Colors.red),
          Text("Raporlar Sayfası Yapım Aşamasında..."),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
