import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_event.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Login/components/login_form.dart';
import 'package:gatecheck_frontend_flutter/services/auth.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

import 'components/end_float_top_floating_action_button_location.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool failedAuth = false;

  void onLogin(String username, String password, BuildContext context) async {
    try {
      showLoading();
      String token = await login(username, password);
      Navigator.pop(context);
      BlocProvider.of<AuthBloc>(context).add(new LoginEvent(token));
      Navigator.popAndPushNamed(context, '/main/inbox');
    } catch (err) {
      setState(() {
        failedAuth = true;
      });
    }
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Logging in..."),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButtonLocation: EndFloatTopFloatingActionButtonLocation(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.language,
          color: Colors.blueAccent[700],
          size: getPercentageOfScreenWidth(context, 10),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: getPercentageOfScreenHeight(context, 4)),
                child: Image.asset(
                  'assets/icon.png',
                  height: getPercentageOfScreenHeight(context, 30),
                )),
            SizedBox(
              height: 20,
            ),
            LoginForm(
              
              onLogin: this.onLogin,
            )
          ],
        ),
      ),
    );
  }
}
