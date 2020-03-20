import 'package:flutter/material.dart';

class ForgotPasswordSignupButtonGroup extends StatelessWidget {
  const ForgotPasswordSignupButtonGroup({Key key}) : super(key: key);

  onSignupClick(BuildContext context) {
    Navigator.popAndPushNamed(context, '/signup');
  }

  onForgotPasswordClick(BuildContext context) {
    Navigator.popAndPushNamed(context, '/forgotpassword');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 1.2) +
                    10,
                right: 20),
            child: RaisedButton(
              elevation: 7,
              onPressed: () => this.onSignupClick(context),
              color: Theme.of(context).colorScheme.secondaryVariant,
              child: Text('Signup'),
              textColor: Colors.white,
            ),
          ),
          ButtonTheme(
            child: RaisedButton(
              elevation: 7,
              onPressed: () => this.onForgotPasswordClick(context),
              color: Theme.of(context).colorScheme.secondaryVariant,
              child: Text('Forgot Password'),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
