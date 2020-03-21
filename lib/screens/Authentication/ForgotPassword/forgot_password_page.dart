import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/ForgotPassword/components/forgot_password_form.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

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
              'Forgot Password',
              style: TextStyle(fontSize: 32),
            ),
            actions: <Widget>[],
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: getPercentageOfScreenHeight(context, 10)),
            Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 1.2)) /
                        2),
                child: Text(
                  'Please enter your email:',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                )),
            SizedBox(height: getPercentageOfScreenHeight(context, 3)),
            ForgotPasswordForm()
          ],
        ),
      ),
    );
  }
}
