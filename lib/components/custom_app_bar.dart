import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/views/authentication/signin_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logOut() {
      FirebaseAuth.instance.signOut().then((value) {
        HelperFunctions.saveUserLoggedInDetails(isLoggedIn: false);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SignInScreen()),
            (Route<dynamic> route) => false);
      });
    }

    return AppBar(
      title: Text(appName),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(Icons.logout))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
