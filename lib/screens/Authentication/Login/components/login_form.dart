import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/forgot_password_signup.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 1.2)) / 2, right: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 1.2)) / 2),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width / 1.2,
            child: RaisedButton(
              elevation: 7,
              onPressed: this.onSubmit,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
              textColor: Colors.white,
            ),
          ),
          ForgotPasswordSignupButtonGroup()
        ]));
  }
}
