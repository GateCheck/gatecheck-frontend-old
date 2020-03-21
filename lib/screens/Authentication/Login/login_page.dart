import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/login_form.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

import 'components/end_float_top_floating_action_button_location.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: getPercentageOfScreenHeight(context, 4)),
                child: Image.asset(
                  'assets/icon.png',
                  height: getPercentageOfScreenHeight(context, 30),
                )),
            SizedBox(
              height: 20,
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
