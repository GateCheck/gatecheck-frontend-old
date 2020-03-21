import 'package:flutter/material.dart';

class ForgotPasswordSignupButtonGroup extends StatelessWidget {
  const ForgotPasswordSignupButtonGroup({Key key}) : super(key: key);

  onSignupClick(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
  }

  onForgotPasswordClick(BuildContext context) {
    Navigator.pushNamed(context, '/forgotpassword');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width)) / 2,
                right: 20),
            child: ButtonTheme(
              minWidth: (MediaQuery.of(context).size.width / 1.2) / 2 - 10,
              child: RaisedButton(
                elevation: 3,
                onPressed: () => this.onSignupClick(context),
                color: Theme.of(context).colorScheme.secondaryVariant,
                child: Text('Signup'),
                textColor: Colors.white,
              ),
            ),
          ),
          ButtonTheme(
            minWidth: (MediaQuery.of(context).size.width / 1.2) / 2 - 10,
            child: RaisedButton(
              elevation: 3,
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
