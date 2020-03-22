import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_event.dart';
import 'package:gatecheck_frontend_flutter/blocs/authBloc/auth_state.dart';
import 'package:gatecheck_frontend_flutter/models/user.dart';
import 'package:gatecheck_frontend_flutter/services/auth.dart';
import 'package:gatecheck_frontend_flutter/services/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthInitialState();

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is LoginEvent || event is SignupEvent) {
        dynamic user = await getUserData((event as dynamic).token);
        if (user is User) {
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      } else {
        dynamic loggedIn = await isLoggedIn();
        if (loggedIn is User) {
          yield AuthenticatedState(user: loggedIn);
        } else {
          yield UnAuthenticatedState();
        }
      }
    } catch (err) {
      yield UnAuthenticatedState();
    }
  }
}
