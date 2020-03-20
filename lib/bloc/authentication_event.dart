part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}


class GetAuthData extends AuthenticationEvent {
  final String username;
  final String password;

  GetAuthData(this.username, this.password);


  @override
  List<Object> get props => [username, password];
}