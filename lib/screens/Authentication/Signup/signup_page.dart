import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_event.dart';
import 'package:gatecheck_frontend_flutter/screens/Authentication/Signup/components/signup_form.dart';
import 'package:gatecheck_frontend_flutter/services/auth.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool authFailed = false;
  String authFailReason;

  void onSignup(
      String email, String password, String school, String fullName) async {
    print("dsads");
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      duration: new Duration(seconds: 20),
      content: new Row(
        children: <Widget>[
          new CircularProgressIndicator(),
          new Text("  Signing-Up...")
        ],
      ),
    ));

    try {
      String token = await signup(email, password, school, fullName);

      BlocProvider.of<AuthBloc>(context).add(new SignupEvent(token));
      Navigator.pushReplacementNamed(context, '/main/inbox');
    } catch (err) {
      setState(() {
        authFailed = true;
        authFailReason = err.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(getPercentageOfScreenHeight(context, 12)),
        child: AppBar(
          centerTitle: true,
          title: Text(
            'Signup',
            style: TextStyle(fontSize: 40),
          ),
          actions: <Widget>[],
        ),
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
            SizedBox(height: getPercentageOfScreenHeight(context, 3)),
            SignupForm(
              onSignup: this.onSignup,
            ),
            authFailed
                ? Text(authFailReason,
                    style: TextStyle(color: Theme.of(context).errorColor))
                : Container(),
          ],
        ),
      ),
    );
  }
}
