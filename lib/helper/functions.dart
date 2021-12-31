import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "USERLOGGEDINKEY";

  static saveUserLoggedInDetails({required bool isLoggedIn}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggedInKey, isLoggedIn);
  }

  static Future<bool?> getUserLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //if (prefs.getBool(userLoggedInKey) == null) {
    //return false;
    //}
    //return (prefs.getBool(userLoggedInKey) != null)
    //? prefs.getBool(userLoggedInKey)
    //: false;
    return prefs.getBool(userLoggedInKey);
  }
}
