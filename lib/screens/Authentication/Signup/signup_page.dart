import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Signup/components/signup_form.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(getPercentageOfScreenHeight(context, 12)),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'Signup',
              style: TextStyle(fontSize: 40),
            ),
            actions: <Widget>[],
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: getPercentageOfScreenHeight(context, 3)),
            SignupForm()
          ],
        ),
      ),
    );
  }
}
