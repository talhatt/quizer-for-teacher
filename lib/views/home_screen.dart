import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Sınav Başlat"),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: <Widget>[
                Menu(
                  name: "Sorular",
                  color: Colors.yellow,
                  routeName: "/questions",
                ),
                Menu(
                  name: "Odalar",
                  color: Colors.red,
                  routeName: "/rooms",
                ),
                Menu(
                  name: "Raporlar",
                  color: Colors.blue,
                  routeName: "/reports",
                ),
                Menu(
                  name: "Sonuçlar",
                  color: Colors.green,
                  routeName: "/results",
                ),
                Menu(
                  name: "Profil",
                  color: Colors.purple,
                  routeName: "/profile",
                ),
                Menu(
                  name: "Destek",
                  color: Colors.orange,
                  routeName: "/support",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({
    Key? key,
    required this.name,
    required this.color,
    required this.routeName,
  }) : super(key: key);

  final String name;
  final Color color;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
