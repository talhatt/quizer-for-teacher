import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/menu.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/views/authentication/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  logOut() {
    FirebaseAuth.instance.signOut().then((value) {
      HelperFunctions.saveUserLoggedInDetails(isLoggedIn: false);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => SignInScreen()),
          (Route<dynamic> route) => false);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          buildButton(),
          Expanded(
            child: buildGridView(),
          ),
        ],
      )),
    );
  }

  SizedBox buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Sınav Başlat"),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/rooms");
        },
      ),
    );
  }

  GridView buildGridView() {
    return GridView.count(
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
          widthSize: 0.5,
          heightSize: 0.5,
        ),
        Menu(
          name: "Odalar",
          color: Colors.red,
          routeName: "/rooms",
          svgSrc: "assets/icons/room.svg",
          widthSize: 0.5,
          heightSize: 0.5,
        ),
        Menu(
          name: "Raporlar",
          color: Colors.blue,
          routeName: "/reports",
          svgSrc: "assets/icons/report.svg",
          widthSize: 0.5,
          heightSize: 0.5,
        ),
        Menu(
          name: "Sonuçlar",
          color: Colors.green,
          routeName: "/results",
          svgSrc: "assets/icons/result.svg",
          widthSize: 0.5,
          heightSize: 0.5,
        ),
        Menu(
          name: "Profil",
          color: Colors.purple,
          routeName: "/profile",
          svgSrc: "assets/icons/profile.svg",
          widthSize: 0.5,
          heightSize: 0.5,
        ),
        Menu(
          name: "Destek",
          color: Colors.orange,
          routeName: "/support",
          svgSrc: "assets/icons/support.svg",
          widthSize: 0.5,
          heightSize: 0.5,
        ),
      ],
    );
  }
}
