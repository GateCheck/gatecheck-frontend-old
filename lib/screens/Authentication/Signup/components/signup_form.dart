import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/components/password_text_field.dart';
import 'package:gatecheck_frontend_flutter/services/schools.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class SignupForm extends StatefulWidget {
  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  final fullNameEditController = TextEditingController();
  final schoolEditController = TextEditingController();
  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();
  final schoolNamesFuture = getSchoolNames();

  @override
  void dispose() {
    fullNameEditController.dispose();
    schoolEditController.dispose();
    usernameEditController.dispose();
    passwordEditController.dispose();
    confirmPasswordEditController.dispose();
    super.dispose();
  }

  void onSubmit() {}

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
              TextFormField(
                controller: fullNameEditController,
                decoration: InputDecoration(hintText: "Full Name"),
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 3)),
              StreamBuilder<List<String>>(
                stream: Stream.fromFuture(schoolNamesFuture),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SimpleAutoCompleteTextField(
                      key: key,
                      suggestions: snapshot.data,
                      controller: schoolEditController,
                      decoration: InputDecoration(hintText: "Find your school"),
                    );
                  } else {
                    return TextFormField(
                      enabled: false,
                      decoration:
                          InputDecoration(hintText: "Loading schools..."),
                    );
                  }
                },
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 3)),
              TextFormField(
                controller: usernameEditController,
                decoration: InputDecoration(hintText: "Username"),
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 3)),
              PasswordTextField(
                controller: passwordEditController,
                defaultVisibile: false,
                hintText: "Password",
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 3)),
              PasswordTextField(
                controller: confirmPasswordEditController,
                defaultVisibile: false,
                hintText: "Confirm Password",
              ),
              SizedBox(height: getPercentageOfScreenHeight(context, 3)),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: getPercentageOfScreenHeight(context, 6),
                child: RaisedButton(
                  elevation: 3,
                  onPressed: this.onSubmit,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  child: Text('Signup', style: TextStyle(fontSize: 24),),
                  textColor: Colors.white,
                ),
              )
            ])));
  }
}
