import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/components/password_text_field.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Signup/components/school_finder.dart';
import 'package:gatecheck_frontend_flutter/services/auth.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';
import 'package:validators/validators.dart';

class SignupForm extends StatefulWidget {
  final Function onSignup;

  const SignupForm({Key key, @required this.onSignup}) : super(key: key);

  @override
  SignupFormState createState() {
    return SignupFormState(this.onSignup);
  }
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final void Function(String email, String password, String school, String fullName) onSignup;

  final fullNameEditController = TextEditingController();
  final schoolEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();

  SignupFormState(this.onSignup);

  @override
  void dispose() {
    fullNameEditController.dispose();
    schoolEditController.dispose();
    emailEditController.dispose();
    passwordEditController.dispose();
    confirmPasswordEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            child: Column(children: <Widget>[
              TextFormField(
                controller: fullNameEditController,
                decoration: InputDecoration(hintText: "Full Name", border: OutlineInputBorder()),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 4)),
              SchoolAutoCompleteFormField(
                border: OutlineInputBorder(),
                hintText: "Please enter your school's name."
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 4)),
              TextFormField(
                controller: emailEditController,
                decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder()),
                validator: (val) {
                  if (val.trim().isEmpty) {
                    return 'Please enter your email';
                  } else if (!isEmail(val)) {
                    return 'Please choose a valid email.';
                  }
                  return null;
                },
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 4)),
              PasswordTextFormField(
                controller: passwordEditController,
                defaultVisibile: false,
                inputBorder: OutlineInputBorder(),
                hintText: "Password",
                validator: (val) {
                  if (val.trim().isEmpty) {
                    return 'Please enter your password';
                  } else if (val.trim() != confirmPasswordEditController.text.trim()) {
                    return 'Passwords don\'t match';
                  } else if (val.trim().length < 8) {
                    return 'Choose a longer password';
                  }
                  return null;
                },
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 4)),
              PasswordTextFormField(
                controller: confirmPasswordEditController,
                defaultVisibile: false,
                inputBorder: OutlineInputBorder(),
                hintText: "Confirm Password",
                validator: (val) {
                  if (val.trim().isEmpty) {
                    return 'Please enter your password';
                  } else if (val.trim() != passwordEditController.text.trim()) {
                    return 'Passwords don\'t match';
                  } else if (val.trim().length < 8) {
                    return 'Choose a longer password';
                  }
                  return null;
                },
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 4)),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: getPercentageOfScreenHeight(context, 6),
                child: RaisedButton(
                  elevation: 3,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      onSignup(emailEditController.text, passwordEditController.text, schoolEditController.text, fullNameEditController.text);
                    }
                  },
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 24),
                  ),
                  textColor: Colors.white,
                ),
              )
            ])));
  }
}
