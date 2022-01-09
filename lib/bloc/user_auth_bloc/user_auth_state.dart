part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthState {
  const UserAuthState();

  List<Object> get props => [];
}

class StateUserAuthInitialization extends UserAuthState {}
class StateUserAuthLoggedIn extends UserAuthState {
  final ParseUser user;

  const StateUserAuthLoggedIn({ required this.user});

  @override
  List<Object> get props => [user];
}
class StateUserAuthUnAuthorized extends UserAuthState {}

class StateUserAuthFailure extends UserAuthState {
  final String message;

  const StateUserAuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}
