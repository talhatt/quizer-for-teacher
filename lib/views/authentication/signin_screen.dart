import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/models/user/signin/signin_error.dart';
import 'package:quizer/models/user/signin/signin_request.dart';
import 'package:quizer/services/firebase_service.dart';
import 'package:quizer/views/authentication/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
  static String routeName = "/signin";
}

class _SignInScreenState extends State<SignInScreen> {
  //var email;
  //var password;
  //FirebaseService service = FirebaseService();
  GlobalKey<ScaffoldState> scaffold = GlobalKey();

  //FirebaseAuth paketi ile giriş
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //Login methodu
  login() async {
    try {
      final User? user =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ))
              .user;
      if (user != null) {
        HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);
        Navigator.pushNamed(context, "/home");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        scaffold.currentState!.showSnackBar(SnackBar(
            content: Text(
                'Bu e-mail adresi ile kayıtlı kullanıcı bulunmamaktadır!')));
      } else if (e.code == 'wrong-password') {
        scaffold.currentState!
            .showSnackBar(SnackBar(content: Text('Şifre yanlış!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: Colors.black,
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: Text("Kaydol",
                              style: Theme.of(context).textTheme.button)),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.alternate_email,
                            color: primaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: email,
                            /*
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            */
                            decoration: InputDecoration(
                              hintText: "E-mail",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          /*
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          */
                          decoration: InputDecoration(
                            hintText: "Şifre",
                          ),
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
                          /*
                          onTap: () async {
                            var result = await service.postUser(SigninRequest(
                                email: this.email,
                                password: this.password,
                                returnSecureToken: true));

                            if (result is SigninError) {
                              scaffold.currentState!.showSnackBar(SnackBar(
                                content: Text(result.error!.message ?? 'Error'),
                              ));
                            } else {
                              Navigator.pushNamed(context, "/home");
                            }
                          },
                          */
                          onTap: () {
                            login();
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
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
