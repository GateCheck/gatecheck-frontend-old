import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
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
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: getPercentageOfScreenHeight(context, 3),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: getPercentageOfScreenHeight(context, 9),
              child: RaisedButton(
                elevation: 7,
                onPressed: this.onSubmit,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
                ),
                textColor: Colors.white,
              ),
            ),
          ]),
        ));
  }
}
