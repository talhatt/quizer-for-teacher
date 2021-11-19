import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/components/custom_app_bar.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/views/authentication/signin_screen.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    logOut() {
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SignInScreen()),
            (Route<dynamic> route) => false);
      });
    }

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appName),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  logOut();
                },
                icon: Icon(Icons.logout))
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Profil",
              ),
              Tab(
                text: "Bilgiler",
              ),
              Tab(
                text: "Hesap",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildProfileTab(),
            buildInformationsTab(),
            buildAccountTab(),
          ],
        ),
      ),
    );
  }

  ListView buildProfileTab() {
    return ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(height: 5),
      TextField(
        decoration: InputDecoration(
          labelText: "Ad",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          labelText: "Soyad",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          labelText: "E-mail",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          labelText: "Telefon(isteğe bağlı)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {}, child: Text("Kaydet")),
    ]);
  }

  ListView buildInformationsTab() {
    return ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(height: 5),
      TextField(
        decoration: InputDecoration(
          labelText: "Okul",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          labelText: "Rol",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {}, child: Text("Kaydet")),
    ]);
  }

  ListView buildAccountTab() {
    return ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(height: 5),
      ElevatedButton(onPressed: () {}, child: Text("Şifre Değiştir")),
      ElevatedButton(onPressed: () {}, child: Text("Hesabı Sil")),
    ]);
  }
}
