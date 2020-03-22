import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/components/password_text_field.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/forgot_password_signup.dart';

class LoginForm extends StatefulWidget {

  final Function onLogin;
  final bool authFailed;

  const LoginForm({Key key, @required this.onLogin, this.authFailed = false}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState(this.onLogin, this.authFailed);
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final Function onLogin;
  final bool authFailed;

  LoginFormState(this.onLogin, this.authFailed);

  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();

  @override
  void dispose() {
    usernameEditController.dispose();
    passwordEditController.dispose();
    super.dispose();
  }

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
                  decoration: InputDecoration(hintText: "Username", border: OutlineInputBorder(), errorText: this.authFailed ? 'Wrong username or password.' : '' ),
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordTextField(
                  controller: passwordEditController,
                  defaultVisibile: false,
                  hintText: "Password",
                  inputBorder: OutlineInputBorder(),
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
                onPressed: () => this.onLogin(usernameEditController.text, passwordEditController.text, context),
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
