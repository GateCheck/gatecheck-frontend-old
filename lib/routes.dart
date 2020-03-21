import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/ForgotPassword/forgot_password_page.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/login_page.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => LoginPage(),
  "/forgotpassword": (BuildContext context) => ForgotPasswordPage(),
  "/signup": (BuildContext context) => Scaffold(),
  "/ExScreen2": (BuildContext context) => Scaffold(),
};