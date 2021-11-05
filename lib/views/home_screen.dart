import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizer/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Sınav Başlat"),
              ),
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
                    svgSrc: "assets/icons/question.svg",
                  ),
                  Menu(
                    name: "Odalar",
                    color: Colors.red,
                    routeName: "/rooms",
                    svgSrc: "assets/icons/room.svg",
                  ),
                  Menu(
                    name: "Raporlar",
                    color: Colors.blue,
                    routeName: "/reports",
                    svgSrc: "assets/icons/report.svg",
                  ),
                  Menu(
                    name: "Sonuçlar",
                    color: Colors.green,
                    routeName: "/results",
                    svgSrc: "assets/icons/result.svg",
                  ),
                  Menu(
                    name: "Profil",
                    color: Colors.purple,
                    routeName: "/profile",
                    svgSrc: "assets/icons/profile.svg",
                  ),
                  Menu(
                    name: "Destek",
                    color: Colors.orange,
                    routeName: "/support",
                    svgSrc: "assets/icons/support.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({
    Key? key,
    required this.name,
    required this.color,
    required this.routeName,
    required this.svgSrc,
  }) : super(key: key);

  final String name;
  final Color color;
  final String routeName;
  final String svgSrc;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(200),
      shadowColor: Colors.black,
      elevation: 30,
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  child: SvgPicture.asset(svgSrc),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ]),
      ),
    );
  }
}
