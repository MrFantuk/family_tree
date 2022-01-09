import 'package:family_tree/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:family_tree/ui/mobile/auth/auth_screen.dart';
import 'package:family_tree/ui/mobile/family_tree.dart';
import 'package:family_tree/widget/animation/bloc_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthBloc, UserAuthState>(builder: (context, state) {
      if (state is StateUserAuthInitialization) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is StateUserAuthLoggedIn) {
        return const AnimationSwitch(child: FamilyTree());
      }
      if (state is StateUserAuthUnAuthorized) {
        return const AnimationSwitch(child: AuthScreen());
      }
      if (state is StateUserAuthFailure) {
        return Center(
          child: Text(state.message),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
