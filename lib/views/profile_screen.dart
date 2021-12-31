import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/views/authentication/signin_screen.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController userSurname = TextEditingController();
    TextEditingController userEmail = TextEditingController();
    TextEditingController userPhoneNumber = TextEditingController();
    TextEditingController userSchool = TextEditingController();
    TextEditingController userRole = TextEditingController();
    String userId = FirebaseAuth.instance.currentUser!.uid;

    //Kullanıcı bilgilerini getir
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      userName.text = value.data()!['userName'];
      userSurname.text = value.data()!['userSurname'];
      userEmail.text = value.data()!['userEmail'];
      userPhoneNumber.text = value.data()!['userPhoneNumber'];
      userSchool.text = value.data()!['userSchool'];
      userRole.text = value.data()!['userRole'];
    });

    //Cıkış yap
    logOut() {
      HelperFunctions.saveUserLoggedInDetails(isLoggedIn: false);
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SignInScreen()),
            (Route<dynamic> route) => false);
      });
    }

    //Kullanıcı bilgilerini güncelle
    save() {
      FirebaseFirestore.instance.collection("users").doc(userId).set({
        "userName": userName.text,
        "userSurname": userSurname.text,
        "userEmail": userEmail.text,
        "userPhoneNumber": userPhoneNumber.text,
        "userSchool": userSchool.text,
        "userRole": userRole.text,
        "userId": userId,
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
            buildProfileTab(
                userName, userSurname, userEmail, userPhoneNumber, save),
            buildInformationsTab(userSchool, userRole, save),
            buildAccountTab(),
          ],
        ),
      ),
    );
  }

  IconButton test(Null logOut()) {
    return IconButton(
        onPressed: () {
          logOut();
        },
        icon: Icon(Icons.arrow_back));
  }

  ListView buildProfileTab(
      TextEditingController userName,
      TextEditingController userSurname,
      TextEditingController userEmail,
      TextEditingController userPhoneNumber,
      Null save()) {
    return ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(height: 5),
      TextField(
        controller: userName,
        decoration: InputDecoration(
          labelText: "Ad",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: userSurname,
        decoration: InputDecoration(
          labelText: "Soyad",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: userEmail,
        decoration: InputDecoration(
          labelText: "E-mail",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: userPhoneNumber,
        decoration: InputDecoration(
          labelText: "Telefon(isteğe bağlı)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: () {
            save();
          },
          child: Text("Kaydet")),
    ]);
  }

  ListView buildInformationsTab(TextEditingController userSchool,
      TextEditingController userRole, Null save()) {
    return ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(height: 5),
      TextField(
        controller: userSchool,
        decoration: InputDecoration(
          labelText: "Okul",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: userRole,
        decoration: InputDecoration(
          labelText: "Rol",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: () {
            save();
          },
          child: Text("Kaydet")),
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
