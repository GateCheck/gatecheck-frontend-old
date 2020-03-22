import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/models/user.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => null;
}
class AuthenticatedState extends AuthState {

  IUser user;

  AuthenticatedState({@required this.user});

  @override
  List<Object> get props => null;
}
class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}