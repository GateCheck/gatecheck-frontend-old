import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gatecheck_frontend_flutter/services/auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is GetAuthData) {
      yield AuthenticationAuthenticating();
      try {
        String token = await login(event.username, event.password);
        yield AuthenticationAuthenticated(token);
      } catch (Error) {
        yield AuthenticationError();
      }
    }
  }
}
