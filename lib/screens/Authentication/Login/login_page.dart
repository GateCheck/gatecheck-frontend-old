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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool failedAuth = false;

  void onLogin(String username, String password) async {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      duration: new Duration(seconds: 20),
      content: new Row(
        children: <Widget>[
          new CircularProgressIndicator(),
          new Text("  Signing-In...")
        ],
      ),
    ));

    String token = await login(username, password);
    if (token == null) {
      Future.delayed(Duration(milliseconds: 600)).whenComplete(() {
        _scaffoldKey.currentState.removeCurrentSnackBar();
        setState(() {
          failedAuth = true;
        });
      });
      return;
    }

    BlocProvider.of<AuthBloc>(context).add(new LoginEvent(token));
    Navigator.pushReplacementNamed(context, '/main/inbox');
  }

  Widget _failedAuth() => failedAuth
      ? Text(
          'Wrong username or password.',
          style: TextStyle(color: Theme.of(context).errorColor),
        )
      : Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButtonLocation: EndFloatTopFloatingActionButtonLocation(context),
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
        margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 1.2)) /
                2,
            right: (MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 1.2)) /
                2),
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
            _failedAuth(),
            SizedBox(
              height: 10,
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
