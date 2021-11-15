import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';

class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);
  static String routeName = "/support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Destek için lütfen aşağıdaki adrese mail atınız"),
            Text("talhaturgut@windowslive.com"),
          ],
        ),
      ),
    );
  }
}
