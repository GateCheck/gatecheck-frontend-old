import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/routes.dart';
import 'package:gatecheck_frontend_flutter/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GateCheck',
      theme: themeData,
      initialRoute: '/',
      routes: routes,
    );
  }
}
