import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';

class Result extends StatelessWidget {
  Result({Key? key}) : super(key: key);
  static String routeName = "/results";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(color: Colors.red),
          Text("Sonuçlar Sayfası Yapım Aşamasında..."),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
