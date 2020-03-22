import 'package:gatecheck_frontend_flutter/models/user.dart';
import 'package:gatecheck_frontend_flutter/services/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "https://gatecheck-backend.herokuapp.com/api";

Future<String> login(String username, String password) async {
  try {
    http.Response res = await http.post(baseUrl + "/user/login",
        body: Map.fromEntries([
          MapEntry("loginUsername", username),
          MapEntry("password", password)
        ]));
    print(res.body);
    if (res.statusCode == 200) {
      return convert.jsonDecode(res.body)['token'];
    } else {
      throw new ArgumentError('Username or password invalid!');
    }
  } catch (Error) {
    throw new ArgumentError('Username or password invalid!');
  }
}

Future<String> signup(
    String email, String password, String school, String fullName) async {
  http.Response res;
  try {
    res = await http.post(baseUrl + "/user/signup",
        body: Map.fromEntries([
          MapEntry("loginUsername", email),
          MapEntry("password", password),
          MapEntry("school", school),
          MapEntry("fullName", fullName)
        ]));
    print(res.body);
    if (res.statusCode == 200) {
      return convert.jsonDecode(res.body)['token'];
    } else {
      throw new ArgumentError(convert.jsonDecode(res.body)['message']);
    }
  } catch (Error) {
    throw new ArgumentError(convert.jsonDecode(res.body)['message']);
  }
}

/**
 * If user is logged in returns User otherwise returns false.
 */
Future<dynamic> isLoggedIn() async {
  try {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    if (token == null) return false;
    IUser user = await getUserData(token);
    return user;
  } catch (err) {
    return false;
  }
}


