import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';

class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);
  static String routeName = "/support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(color: Colors.red),
          Text("Destek için lütfen aşağıdaki adrese mail atınız"),
          LinearProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          LinearProgressIndicator(
            color: Colors.red,
          ),
          Text("talhaturgut@windowslive.com"),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
