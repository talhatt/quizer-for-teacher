import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizer/constants.dart';
import 'package:quizer/helper/functions.dart';
import 'package:quizer/routes.dart';
import 'package:quizer/views/home_screen.dart';
import 'package:quizer/views/profile_screen.dart';
import 'package:quizer/views/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkUserLoggedInStatus();
  }

  checkUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedIn = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Quizer',
      home: (_isLoggedIn ?? false) ? HomeScreen() : WelcomeScreen(),
      //initialRoute: (_isLoggedIn ?? false)
      //? HomeScreen.routeName
      //: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
