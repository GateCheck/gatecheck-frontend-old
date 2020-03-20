import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/login_form.dart';

import 'components/end_float_top_floating_action_button_location.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  getPercentageOfScreenWidth(context, double percent) {
    return (MediaQuery.of(context).size.width / 100) * percent;
  }

  getPercentageOfScreenHeight(context, double percent) {
    return (MediaQuery.of(context).size.width / 100) * percent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: EndFloatTopFloatingActionButtonLocation(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.language,
          color: Colors.blueAccent[700],
          size: getPercentageOfScreenWidth(context, 10),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: getPercentageOfScreenHeight(context, 25)),
                child: Image.asset(
                  'assets/icon.png',
                  width: getPercentageOfScreenWidth(context, 50),
                )),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
