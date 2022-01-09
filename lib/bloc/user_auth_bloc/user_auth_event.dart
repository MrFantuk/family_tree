part of 'user_auth_bloc.dart';

abstract class UserAuthEvent {
  const UserAuthEvent();

  List<Object> get props => [];
}

// Fired just after the app is launched
class EventUserAuthInit extends UserAuthEvent {}

class EventUserLoggedIn extends UserAuthEvent {
  final ParseUser user;

  EventUserLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class EventUserLoggedOut extends UserAuthEvent {}
