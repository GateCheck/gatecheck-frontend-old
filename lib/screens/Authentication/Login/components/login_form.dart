import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/components/password_text_field.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/forgot_password_signup.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();

  @override
  void dispose() {
    usernameEditController.dispose();
    super.dispose();
  }

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 1.2)) /
                  2,
              right: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 1.2)) /
                  2),
          child: Column(children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: usernameEditController,
                  decoration: InputDecoration(hintText: "Username"),
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordTextField(
                  controller: passwordEditController,
                  defaultVisibile: false,
                  hintText: "Password",
                )
              ],
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
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
                textColor: Colors.white,
              ),
            ),
            ForgotPasswordSignupButtonGroup()
          ]),
        ));
  }
}
