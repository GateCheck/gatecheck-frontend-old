import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatecheck_frontend_flutter/routes.dart';
import 'package:gatecheck_frontend_flutter/theme/style.dart';

import 'blocs/authBloc/auth_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>.value(
      value: authBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GateCheck',
        theme: themeData,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
