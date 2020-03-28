import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_state.dart';
import 'package:gatecheck_frontend_flutter/models/user.dart';

class Inbox extends StatelessWidget {
  Inbox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 7,
        child: Container(
            child: ListView(
          children: <Widget>[DrawerHeader(child: null)],
        )),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<AuthBloc>(context),
          builder: (context, state) {
            if (state is AuthInitialState) return AlertDialog(
              title: Text('Loading...'),
              actions: <Widget>[
                CircularProgressIndicator()
              ],
            );
            else if (state is UnAuthenticatedState) Navigator.popAndPushNamed(context, '/');
            IUser user = state.user;
            return Container(
              child: Text(user.fullName),
            );
          }),
    );
  }
}
