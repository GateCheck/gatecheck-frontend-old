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

  onSubmit() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Username"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width / 1.2,
            child: RaisedButton(
              elevation: 7,
              onPressed: this.onSubmit,
              color: Theme.of(context).primaryColor,
              child: Text('Login'),
              textColor: Colors.white,
            ),
          ),
          ForgotPasswordSignupButtonGroup()
        ]));
  }
}
