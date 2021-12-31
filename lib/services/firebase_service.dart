import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quizer/models/user/signin/signin_error.dart';
import 'package:quizer/models/user/signin/signin_request.dart';
import 'package:quizer/models/user/signup/signup_error.dart';
import 'package:quizer/models/user/signup/signup_request.dart';

class FirebaseService {
  static const String FIREBASE_AUTH_URL =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDBLcJGlT_bKsNJ0RgFxyl2UbE3D_rz-eU";
  static const String FIREBASE_SIGNUP_URL =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDBLcJGlT_bKsNJ0RgFxyl2UbE3D_rz-eU";

  Future postUser(SigninRequest request) async {
    var jsonModel = json.encode(request.toJson());
    var url = Uri.parse(FIREBASE_AUTH_URL);
    final response = await http.post(url, body: jsonModel);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
      default:
        var errorJson = json.decode(response.body);
        var error = SigninError.fromJson(errorJson);
        return error;
    }
  }

  Future singupUser(SignupRequest request) async {
    var jsonModel = json.encode(request.toJson());
    var url = Uri.parse(FIREBASE_SIGNUP_URL);
    final response = await http.post(url, body: jsonModel);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
      default:
        var errorJson = json.decode(response.body);
        var error = SignupError.fromJson(errorJson);
        return error;
    }
  }
}
