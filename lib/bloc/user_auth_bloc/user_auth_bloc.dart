import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:family_tree/service/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

part 'user_auth_event.dart';

part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final _auth = AuthService();

  UserAuthBloc() : super(StateUserAuthInitialization()){
    on<EventUserAuthInit>((event, emit) async {
      emit(StateUserAuthInitialization());
      try {
        await Future.delayed(const Duration(milliseconds: 500)); // a simulated delay
        final currentUser = await _auth.getCurrentUser();

        if (currentUser != null) {
          emit(StateUserAuthLoggedIn(user: currentUser));
        } else {
          emit(StateUserAuthUnAuthorized());
        }
      } catch (e) {
        emit(StateUserAuthFailure(message: e.toString()));
      }
    });
  }




  // Stream<UserAuthState> _mapUserLoggedInToState(
  //     EventUserLoggedIn event) async* {
  //   yield StateUserAuthLoggedIn(user: event.user);
  // }
  //
  // Stream<UserAuthState> _mapUserLoggedOutToState(
  //     EventUserLoggedOut event) async* {
  //   await firebaseAuth.signOut();
  //   yield StateUserAuthUnAuthorized();
  // }
}
