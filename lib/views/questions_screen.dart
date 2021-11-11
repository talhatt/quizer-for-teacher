import 'package:flutter/material.dart';
import 'package:quizer/components/menu.dart';
import 'package:quizer/constants.dart';

class Question extends StatefulWidget {
  static String routeName = "/questions";

  Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Soru Hazırla",
                  style: TextStyle(fontSize: 30),
                )),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Menu(
                name: "Seçmeli",
                color: Colors.yellow,
                routeName: "/questions",
                svgSrc: "assets/icons/abc.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "D/Y",
                color: Colors.cyan,
                routeName: "/questions",
                svgSrc: "assets/icons/true.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "Boşluk",
                color: Colors.orange,
                routeName: "/questions",
                svgSrc: "assets/icons/pencil.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
              Menu(
                name: "Karışık",
                color: Colors.redAccent,
                routeName: "/questions",
                svgSrc: "assets/icons/exclamation_mark.svg",
                widthSize: 0.3,
                heightSize: 0.2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sorularım",
                  style: TextStyle(fontSize: 30),
                )),
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Soru Setim - 1"),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_circle)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Soru Setim - 1"),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_circle)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Soru Setim - 1"),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_circle)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Soru Setim - 1"),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_circle)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Soru Setim - 1"),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_circle)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
