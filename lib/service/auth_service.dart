import 'package:family_tree/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthService {
  
  Future<ParseUser?> getCurrentUser() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  void login(context, username, password, emailAddress) async {
    final authBloc = BlocProvider.of<UserAuthBloc>(context);
    final ParseUser user = ParseUser(username, password, emailAddress);
    var response = await user.login();
    if (response.success) {
      authBloc.add(EventUserAuthInit());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.error!.toString())));
    }
  }

  void signUp(context,
      {required String username,
      required String email,
      required String password}) async {
    final authBloc = BlocProvider.of<UserAuthBloc>(context);
    final user = ParseUser.createUser(username, password, email);
    var res = await user.signUp();
    if (res.success) {
      authBloc.add(EventUserAuthInit());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res.error!.exception.toString()),
      ));
    }
  }

  void signOut(context) async {
    final authBloc = BlocProvider.of<UserAuthBloc>(context);
    final user =  await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();
    if (response.success) {
      authBloc.add(EventUserAuthInit());
    }
  }
}
