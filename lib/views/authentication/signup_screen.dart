import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/models/user/signup/signup_error.dart';
import 'package:quizer/models/user/signup/signup_request.dart';
import 'package:quizer/services/firebase_service.dart';
import 'package:quizer/views/authentication/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupScreen();
  }

  static String routeName = "/signup";
}

class _SignupScreen extends State {
  //FirebaseService service = FirebaseService();
  GlobalKey<ScaffoldState> scaffold = GlobalKey();
  //var email;
  //var password;
  //var password2;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  signUp() async {
    if (password.text == password2.text) {
      try {
        final User? user =
            (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        ))
                .user;
        if (user != null) {
          HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);
          Navigator.pushNamed(context, "/home");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          scaffold.currentState!.showSnackBar(
              SnackBar(content: Text("Lütfen daha güçlü bir şifre seçiniz!")));
        } else if (e.code == 'email-already-in-use') {
          scaffold.currentState!.showSnackBar(
              SnackBar(content: Text("Bu e-mail adresi kullanılmaktadır.")));
        }
      } catch (e) {
        print(e);
      }
    } else {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Şifreler uyuşmuyor!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffold,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/quizer.gif"),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ));
                        },
                        child: Text(
                          "Giriş Yap",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                      Text(
                        "Kaydol",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.alternate_email,
                          color: primaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: email,
                          //onChanged: (value) {
                          //setState(() {
                          //email = value;
                          //});
                          //},
                          decoration: InputDecoration(
                            hintText: "E-mail",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          //onChanged: (value) {
                          //setState(() {
                          //password = value;
                          //});
                          //},
                          decoration: InputDecoration(hintText: "Şifre"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.lock, color: primaryColor),
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: password2,
                          //onChanged: (value) {
                          //setState(() {
                          //password2 = value;
                          //});
                          //},
                          decoration: InputDecoration(hintText: "Şifre"),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            signUp();
                          },
                          //onTap: () async {
                          //if (password == password2) {
                          //var result = await service.singupUser(
                          //SignupRequest(
                          //email: this.email,
                          //password: this.password,
                          //returnSecureToken: true));
                          //if (result is SignupError) {
                          //scaffold.currentState!.showSnackBar(SnackBar(
                          //content:
                          //Text(result.error!.message ?? 'Error'),
                          //));
                          //} else {
                          //Navigator.pushNamed(context, "/home");
                          //}
                          //} else {
                          //scaffold.currentState!.showSnackBar(SnackBar(
                          //content: Text("Şifreler uyuşmuyor!"),
                          //));
                          //}
                          //},
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
