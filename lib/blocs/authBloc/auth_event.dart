import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AppStartedEvent extends AuthEvent {
  @override
  List<Object> get props => null;
}

class LoginEvent extends AuthEvent {
  final String token;

  LoginEvent(this.token);

  @override
  List<Object> get props => null;
}

class SignupEvent extends AuthEvent {
  final String token;

  SignupEvent(this.token);

  @override
  List<Object> get props => null;
}